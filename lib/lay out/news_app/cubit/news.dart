
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/lay%20out/news_app/cubit/Cubit.dart';
import 'package:untitled/lay%20out/news_app/cubit/states.dart';
import 'package:untitled/modules/searchScreen/searchscreen.dart';
import 'package:untitled/shared/bloc/bloc.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/remote.dart';

class NewsState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCupit, MainState>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit = NewsCupit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App',
            ),
            actions: [
              IconButton(onPressed: ()
              {
                navigator(context, searchScreen());

              },
                  icon:Icon(Icons.search)),
              IconButton(onPressed: (){
                AppTodoBloc.get(context).ChangeModeApp();
              },
                  icon:Icon(Icons.dark_mode)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items:cubit.bottomState ,
            onTap: (index){
             cubit.ChangeBottomNav(index);
            },
            currentIndex: cubit.currentIndex,
          ),
          body:cubit.bodyScreen[cubit.currentIndex],
        );
      },
    );
  }
}