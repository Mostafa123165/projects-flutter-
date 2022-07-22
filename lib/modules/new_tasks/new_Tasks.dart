import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/bloc/bloc.dart';
import 'package:untitled/shared/bloc/state.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constant.dart';

class NewTasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppTodoBloc,MainClass>(
        listener:(context,state){},
        builder: (context,state){
           return ListView.separated(
             itemBuilder: (context,index)=>buildTasksItem(AppTodoBloc.get(context).newtasks[index] , context),
             separatorBuilder: (context,index)=> Container(
               height:20.0,
               width: double.infinity,
             ),
             itemCount: AppTodoBloc.get(context).newtasks.length ,
           );
        },
    );

  }
}
