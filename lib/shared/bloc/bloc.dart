import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/modules/archived_tasks/archivedTasks.dart';
import 'package:untitled/modules/done_tasks/Done_Tasks.dart';
import 'package:untitled/modules/new_tasks/new_Tasks.dart';
import 'package:untitled/shared/bloc/state.dart';
import 'package:untitled/shared/network/cache_helper.dart';
class AppTodoBloc extends Cubit <MainClass>
{
  AppTodoBloc() : super(InitialState());
  static AppTodoBloc get(context) => BlocProvider.of(context) ;

  int showonhome=0 ;
  bool ispressfloatbutton= false ;
  bool isicon= true ;

  List<String>textshowonhome=
  [
    'New Tasks',
    'Done Tasks',
    'archived Tasks',
  ];

  List<Widget>screen=[
    NewTasks(),
    DoneTasks(),
    ArchivedTasks(),
  ];

  void ChangeNavigator(value) {
    showonhome = value ;
    emit(ChangeBottomNavigatorState()) ;
  }
  void ClosingFloatingBottom(bool IsICon , bool IspressFloatButton ) {
    isicon = IsICon;
    ispressfloatbutton =IspressFloatButton ;
    emit(ClosingFloatingBottomState()) ;
  }

  void OpeningFloatingBottom(bool IsICon , bool IspressFloatButton ) {
    isicon = IsICon;
    ispressfloatbutton =IspressFloatButton ;
    emit(OpeningFloatingBottomState()) ;
  }

    Database? database ;
    List<Map>newtasks=[] ;
    List<Map>donetasks=[] ;
    List<Map>archivedtasks=[] ;
    Future<void> CreatDatePase() async {
      database = await openDatabase(
          'todo.dp',
          version: 1,
          onCreate: (database, int version) async {
            await database.execute(
                'CREATE TABLE Test (id INTEGER PRIMARY KEY, Title TEXT, Time TEXT, Date TEXT,state TEXT)').
            then((value) =>
            {
              print("Creating Datebase"),
            });
          },
          onOpen:(database)
          {
            GetDateBase(database) ;
            print('open datebase');
          }
      );
    }
    void UpdateDatebase({required String state , required int id, }) {
      database!.rawUpdate(
        'UPDATE Test SET state = ? WHERE id = ?',
        ['$state','$id',]).then((value) => {
          GetDateBase(database),
          emit(AppUpdatetDatebaseState()),
      });
  }
    Future InsertDatebase({@required title,@required time,@required date}) async {
    await database!.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO Test(Title, Time, Date,state) VALUES ("$title", "$time", "$date","new")');
    }).then((value) => {
      GetDateBase(database)
      //print("insert successful"),
    });
  }
    void GetDateBase(database)    {
      newtasks=[] ; archivedtasks=[] ; donetasks=[] ;
      database.rawQuery('SELECT * FROM Test').then((value) =>
      {
        value.forEach((element) {
          if(element['state']=="new") newtasks.add(element);
          else if(element['state']=="done") donetasks.add(element);
          else  archivedtasks.add(element);
        }),
        emit(AppGetDatebaseState()),
      }
      ) ;
  }

       bool iSLightMOde = true ;

       void ChangeModeApp({ bool? fromShared }){
         if(fromShared == null){
           iSLightMOde = !iSLightMOde ;
         }
         else {
           iSLightMOde = fromShared ;
     }
    CacheHelper.setStateApp(key: "isLightMOde", value: iSLightMOde).then((value) {
      emit(ChangeLightModeState());
    });
  }

}