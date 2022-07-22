/*

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

class HomeLayOut extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var validateKey =GlobalKey<FormState>();
  var controlerTaskTitle = TextEditingController();
  var controlerTaskTime = TextEditingController();
  var controlerTaskDate = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppTodoBloc()..CreatDateBase(),
      child: BlocConsumer<AppTodoBloc,MainClass>(
        listener:(context,state){} ,
        builder:(context,state){
          return Scaffold(
            key:scaffoldKey,
            appBar: AppBar(
              title: Text(
                AppTodoBloc.get(context).ttitle[AppTodoBloc.get(context).currentIndex],
              //  bloc.ttitle[bloc.currentIndex],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: ()
              {
                if(!AppTodoBloc.get(context).pressFloatingAction){
                  scaffoldKey.currentState?.showBottomSheet(
                        (context)
                    => Form(
                      key: validateKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          defaultTextFormField(
                              lapel: 'Task title',
                              type: TextInputType.text,
                              prefix: Icons.title,
                              controler:controlerTaskTitle,
                              validator:(value)
                              {
                                String s = value.toString() ;
                                if(s.isEmpty){
                                  return 'This Task Title must not empty' ;
                                }
                                return null ;
                              },
                              onTap:()
                              {
                                print(controlerTaskTitle.toString());
                              }
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          defaultTextFormField(
                              lapel: 'Task Time',
                              type: TextInputType.numberWithOptions(),
                              prefix: Icons.watch_later_outlined,
                              controler:controlerTaskTime,
                              validator:(value)
                              {
                                String ss = value.toString() ;
                                if(ss.isEmpty){
                                  return 'this Task Time must not empty' ;
                                }
                                return null;
                              },
                              onTap:()
                              {
                                showTimePicker(
                                  context: context,
                                  initialTime:TimeOfDay.now() ,
                                ).then((value)
                                {
                                  controlerTaskTime.text= value!.format(context);
                                  print(value.format(context));
                                }
                                );
                              }
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          defaultTextFormField(
                              lapel: 'Task Date',
                              type: TextInputType.numberWithOptions(),
                              prefix: Icons.date_range,
                              controler:controlerTaskDate,
                              validator:(value)
                              {
                                String ss = value.toString() ;
                                if(ss.isEmpty){
                                  return 'this Task Date must not empty' ;
                                }
                                return null;
                              },
                              onTap:()
                              {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2023),
                                ).then((value) => {
                                  controlerTaskDate.text=DateFormat.yMMMd().format(value!) ,
                                });
                              }
                          ),
                        ],
                      ),
                    ),
                  ).closed.then((value) {
                    // Navigator.pop(context);
                    AppTodoBloc.get(context).ChangeFloatingSheet(
                        Isedit:true ,
                      PressFloatingAction: false ,
                    );
                  });
                  AppTodoBloc.get(context).ChangeFloatingSheet(
                    Isedit:false ,
                    PressFloatingAction: true ,
                  );
                }
                else {
                  if(validateKey.currentState!.validate()) {
                    AppTodoBloc.get(context).ChangeFloatingSheet(
                      Isedit:true ,
                      PressFloatingAction: false ,
                    );
                    AppTodoBloc.get(context).InsertDatePase(
                      date:controlerTaskDate ,
                      time: controlerTaskTime ,
                      title: controlerTaskTitle ,
                    ).then((value)  {
                      Navigator.pop(context);
                      AppTodoBloc.get(context).ChangeFloatingSheet(
                        Isedit:true ,
                        PressFloatingAction: false ,
                      );
                    });

                  }
                }
              },
              child:Icon(
                AppTodoBloc.get(context).isedit ? Icons.edit : Icons.add ,
              ),
            ),
            bottomNavigationBar:BottomNavigationBar(
              type:BottomNavigationBarType.fixed ,
              currentIndex:AppTodoBloc.get(context).currentIndex,
              onTap:(index){
                AppTodoBloc.get(context).changeBottomNav(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon:Icon(
                    Icons.menu ,
                  ),
                  label: 'Tasks' ,
                ),
                BottomNavigationBarItem(
                  icon:Icon(
                    Icons.check_circle_outline ,
                  ),
                  label: 'Done' ,
                ),
                BottomNavigationBarItem(
                  icon:Icon(
                    Icons.archive_outlined ,
                  ),
                  label: 'Archived' ,
                ),
              ],
            ),
           // body:bloc.screen[bloc.currentIndex],
             body:AppTodoBloc.get(context).screen[AppTodoBloc.get(context).currentIndex],
          );
        } ,
      )
    );
  }
}

*/
