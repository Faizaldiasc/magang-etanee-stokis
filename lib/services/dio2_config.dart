import 'package:dio/dio.dart';
class DioConfig2 {
  static Dio dio;
  // static const String KEY_AUTH = 'Authorization';
  static Dio get () {
    if (dio == null) {
      dio = new Dio();
      dio.options.connectTimeout = 5000;
      dio.options.receiveTimeout = 3000;
      dio.options.contentType = "application/json";
      dio.options.baseUrl = "https://api-etanee.herokuapp.com";
    }
    return dio;
  }
}