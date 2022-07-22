
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/lay%20out/news_app/cubit/Cubit.dart';
import 'package:untitled/lay%20out/news_app/cubit/states.dart';
import 'package:untitled/shared/bloc/bloc.dart';
import 'package:untitled/shared/bloc/state.dart';
import 'package:untitled/shared/bloc_opserver.dart';
import 'package:untitled/shared/network/cache_helper.dart';
import 'package:untitled/shared/network/remote.dart';
import 'BMI Screen.dart';
import 'LoginScreen.dart';
import 'NewScreen2.dart';
import 'ResScreen.dart';
import 'SecondScreen.dart';
import 'WhatsAppScreen.dart';
import 'google.dart';
import 'lay out/Home_layout.dart';
/*
import 'lay out/bolc/bloc.dart';
*/
import 'lay out/counterscreen.dart';
import 'lay out/news_app/cubit/news.dart';
import 'lay out/secondhome.dart';
import 'modules/new_tasks/new_Tasks.dart';
void main()  async{

  WidgetsFlutterBinding.ensureInitialized() ;
  DioHelper.init();

  await CacheHelper.init();
  bool? isLightMode =CacheHelper.getStateApp(key:'isLightMOde') ;

  BlocOverrides.runZoned(
        () {
          runApp( MyApp(isLightMode!));
        },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {

  final bool LightMode ;
  MyApp(this.LightMode) ;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=>NewsCupit()..GetDateBusniess()..GetDateSports()..GetDateScience(),),
        BlocProvider(create:(BuildContext context)=> AppTodoBloc()..ChangeModeApp(
          fromShared: LightMode
          ),
        ),
      ],
      child: BlocConsumer<AppTodoBloc,MainClass>(
        listener: (context,state){},
        builder: (context,state) {
          return MaterialApp(
             debugShowCheckedModeBanner: false,
             theme: ThemeData(
        primarySwatch:Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme:const AppBarTheme(
          color: Colors.white ,
          backwardsCompatibility:false,
          systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.orangeAccent ,
        ), //status
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color:Colors.black,
            fontWeight:FontWeight.bold,
            fontSize:20.0,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 20.0,
          selectedItemColor:Colors.orangeAccent,
          unselectedItemColor: Colors.grey,
          backgroundColor:Colors.white,
        ),
        textTheme:const TextTheme(
          bodyText1:TextStyle(
            fontSize:18.0,
            fontWeight:FontWeight.w600,
            color: Colors.black,
          ),
          bodyText2:TextStyle(
            fontSize:13.0,
            fontWeight:FontWeight.w600,
            color: Colors.black,
          )
        ),
      ),
             darkTheme: ThemeData(
        scaffoldBackgroundColor:HexColor('333739'),
        appBarTheme: AppBarTheme(
          color: HexColor('333739') ,
          backwardsCompatibility:false,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.orangeAccent ,
          ), //status
          elevation: 0.0,
          titleTextStyle: const TextStyle(
            color:Colors.white,
            fontWeight:FontWeight.bold,
            fontSize:20.0,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        bottomNavigationBarTheme:  BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 20.0,
          selectedItemColor:Colors.orangeAccent,
          unselectedItemColor: Colors.grey,
          backgroundColor:HexColor('333739'),
        ),
        textTheme:TextTheme(
          bodyText1:TextStyle(
            fontSize:18.0,
            fontWeight:FontWeight.w600,
            color: Colors.white,
          ),
          bodyText2:TextStyle(
              fontSize:13.0,
              fontWeight:FontWeight.w600,
              color: Colors.white,
            )

        ),
      ),
             themeMode:AppTodoBloc.get(context).iSLightMOde ? ThemeMode.light :ThemeMode.dark ,
             home: NewsState(),
          );
        },
      ),
    );
  }
}









