import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/lay%20out/news_app/cubit/Cubit.dart';
import 'package:untitled/lay%20out/news_app/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';

class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCupit,MainState>(
        listener: (context,state){},
        builder: (context,state) {
          return BuildAllScreen(NewsCupit.get(context).sports,context) ;
        }
    );
  }
}
