import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;
  static init(){ // to go server
   dio =  Dio (
     BaseOptions(
       baseUrl: 'https://newsapi.org/' ,
       receiveDataWhenStatusError: true ,
     )
    );
  }

  static Future<Response> getDate({
    required String methodUrl ,
    required Map<String,dynamic>queries,
      }) async
  {
   return await dio.get(
      methodUrl,queryParameters:queries,
    );
  }
}