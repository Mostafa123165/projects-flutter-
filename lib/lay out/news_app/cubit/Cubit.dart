
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/lay%20out/news_app/cubit/states.dart';
import 'package:untitled/modules/business_screen/business_screen.dart';
import 'package:untitled/modules/setting/sesting.dart';
import 'package:untitled/modules/science_screen/sciense_screen.dart';
import 'package:untitled/modules/sports_screen/sports_screen.dart';
import 'package:untitled/shared/network/remote.dart';


class NewsCupit extends Cubit <MainState>
{
     NewsCupit() : super(NewsInitialState());

  static NewsCupit get(context) => BlocProvider.of(context) ;

   int currentIndex = 0 ;
  List<BottomNavigationBarItem>bottomState = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business) ,
      label:'business'
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports) ,
      label:'sports'
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science) ,
      label:'science'
    ),
  ];
  List<Widget>bodyScreen=[
    Business(),
    Sports(),
    Science(),
  ];
     List<dynamic> business = [];
     List<dynamic> sports = [];
     List<dynamic> science = [];
     List<dynamic> search = [];
     void ChangeBottomNav(index){
       currentIndex = index ;
       emit(NewBottomNavState()) ;
     }
   void GetDateBusniess(){
         emit(NewLoadingState());
         if(business.length == 0) {
           DioHelper.getDate(
               methodUrl: 'v2/top-headlines',
               queries: {
                 'country': 'eg',
                 'category': 'business',
                 'apiKey': '4ba970becf4849db8d518050ffc8194f',
               }
           ).then((value) {
             print(value.data['articles']);
             business = value.data['articles'];
             print(business[0]['title']);
             emit(NewsGetBusinessSuccessState());
           }).catchError((error) {
             print(error.toString());
             emit(NewsGetBusinessErrorState(error.toString()));
           });
         }
         else{
           emit(NewsGetBusinessSuccessState());
         }

  }
   void GetDateSports(){

    emit(NewLoadingSportsState()) ;
    if(sports.length == 0) {
      DioHelper.getDate(
          methodUrl: 'v2/top-headlines',
          queries: {
            'country': 'eg',
            'category': 'sports',
            'apiKey': '4ba970becf4849db8d518050ffc8194f',
          }
      ).then((value) {
        print(value.data['articles']);
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }
    else {
      emit(NewsGetSportsSuccessState());
    }
  }
   void GetDateScience(){
    emit(NewLoadingScienceState());
    if (science.length == 0) {
      DioHelper.getDate(
          methodUrl: 'v2/top-headlines',
          queries: {
            'country': 'eg',
            'category': 'science',
            'apiKey': '4ba970becf4849db8d518050ffc8194f',
          }
      ).then((value) {
        print(value.data['articles']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }
    else {
      emit(NewsGetScienceSuccessState());
    }
  }
   void getSearch(String value){
       emit(NewLoadingSearshState()) ;
       DioHelper.getDate(
             methodUrl: 'v2/everything',
             queries: {
             'q':'$value',
             'apiKey': '4ba970becf4849db8d518050ffc8194f',
            }
       ).then((value) {
         print(value.data['articles']);
         search = value.data['articles'];
         emit(NewsGetSearshSuccessState());
       }).catchError((error) {
         print(error.toString());
         emit(NewsGetSearshErrorState(error.toString()));
       });
   }

}
