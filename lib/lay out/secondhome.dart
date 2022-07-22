
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/modules/archived_tasks/archivedTasks.dart';
import 'package:untitled/modules/done_tasks/Done_Tasks.dart';
import 'package:untitled/modules/new_tasks/new_Tasks.dart';
import 'package:untitled/shared/bloc/bloc.dart';
import 'package:untitled/shared/bloc/state.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constant.dart';

class HomeScreen extends StatelessWidget{
  var scaffoldkey =GlobalKey<ScaffoldState>() ;
  var formkey =GlobalKey<FormState>() ;
  var controlerTaskTitle = TextEditingController();
  var controlerTaskTime = TextEditingController();
  var controlerTaskDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
      return BlocProvider(
        create:(BuildContext context) => AppTodoBloc()..CreatDatePase(),
         child: BlocConsumer<AppTodoBloc, MainClass>(
          listener: (context,state){},
          builder: (context,state)
          {
            return Scaffold(
              key: scaffoldkey,
              appBar:AppBar(
                title:Text(
                  AppTodoBloc.get(context).textshowonhome[AppTodoBloc.get(context).showonhome],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed:()
                {
                  if(!AppTodoBloc.get(context).ispressfloatbutton)
                  {
                    scaffoldkey.currentState?.showBottomSheet(
                          (context)
                      =>
                          Padding(
                            padding: const EdgeInsets.symmetric
                              (horizontal: 20.0) ,
                            child: Form(
                              key:formkey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultTextFormField(
                                    type:TextInputType.emailAddress,
                                    lapel:'Text Title',
                                    prefix:Icons.title,
                                    controler: controlerTaskTitle,
                                    onTap:()
                                    {
                                      print('this is input text title');
                                    } ,
                                    validator: (value)
                                    {
                                      String t =value.toString() ;
                                      if(t.isEmpty){
                                        return ('oops !!Text Title must contain value');
                                      }
                                      return null ;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultTextFormField(
                                    type:TextInputType.text,
                                    lapel:' Time',
                                    prefix:Icons.title,
                                    controler:controlerTaskTime,
                                    onTap: ()
                                    {
                                      showTimePicker(
                                        context: context,
                                        initialTime:TimeOfDay.now(),
                                      ).then((value) =>
                                      {
                                        controlerTaskTime.text=value!.format(context),
                                      }
                                      );
                                    },
                                    validator: (value)
                                    {
                                      String t =value.toString() ;
                                      if(t.isEmpty){
                                        return ('oops !Time must contain value');
                                      }
                                      return null ;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultTextFormField(
                                    type:TextInputType.text,
                                    lapel:' Date',
                                    prefix:Icons.title,
                                    controler: controlerTaskDate,
                                    onTap: ()
                                    {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: (DateTime(2030)),
                                      ).then((value) => {
                                        controlerTaskDate.text=DateFormat.yMMMd().format(value!) ,
                                      });
                                    },
                                    validator: (value)
                                    {
                                      String t =value.toString() ;
                                      if(t.isEmpty){
                                        return ('oops !! Date must contain value');
                                      }
                                      return null ;
                                    },
                                  )

                                ],
                              ),
                            ),
                          ),
                    ).closed.then((value) =>
                    {
                      AppTodoBloc.get(context).ClosingFloatingBottom(true , false)
                    }
                    );
                    AppTodoBloc.get(context).OpeningFloatingBottom(false , true);
                  }
                  else {
                    if (formkey.currentState!.validate()) {
                      AppTodoBloc.get(context).InsertDatebase(
                        title: controlerTaskTitle.text,
                        time:  controlerTaskTime.text,
                        date:  controlerTaskDate.text,
                      ).then((value) => {
                       AppTodoBloc.get(context).ClosingFloatingBottom(true , false),
                        Navigator.pop(context) ,
                    });
                    }
                  }
                },
                child: Icon(
                  AppTodoBloc.get(context).isicon? Icons.edit : Icons.add ,
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                type:BottomNavigationBarType.fixed,
                currentIndex:AppTodoBloc.get(context).showonhome,
                onTap: (value){
                  AppTodoBloc.get(context).ChangeNavigator(value) ;
                },
                items: const [
                  BottomNavigationBarItem(
                    icon:Icon(
                        Icons.menu
                    ) ,
                    label: 'Tasks',

                  ),
                  BottomNavigationBarItem(
                    icon:Icon(
                        Icons.check_circle_outline
                    ) ,
                    label: 'Done',
                  ),
                  BottomNavigationBarItem(
                    icon:Icon(
                        Icons.archive_outlined
                    ) ,
                    label: 'Archived',
                  ),
                ],
              ),
              body: ConditionalBuilder(
               condition:5>0,
               builder:(context) => Center(
               child:AppTodoBloc.get(context).screen[AppTodoBloc.get(context).showonhome],
                 ),
               fallback:(context) => Center(child: CircularProgressIndicator()),
               ),
            );
          },
        )
      );
  }

}

