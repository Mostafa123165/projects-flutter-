import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/lay%20out/news_app/cubit/Cubit.dart';
import 'package:untitled/lay%20out/news_app/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';

class searchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String controlerInput ="";
    return BlocConsumer<NewsCupit,MainState>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCupit.get(context).search ;
        return Scaffold(
          appBar: AppBar(),
          body:Column(
            children:[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText:"Search",
                    prefixIcon:Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType:TextInputType.text,
                  /*validator:(String? value){
                    value = value.toString() ;
                    return (value.isEmpty) ? 'Please enter some text ' : null;
                  },*/
                  onChanged:(value){
                    NewsCupit.get(context).getSearch(value);
                  },
                  /*controller: TextEditingController(
                  text:controlerInput,
                ),*/
                ),
              ),
              Expanded(child: BuildAllScreen(list,context,isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
