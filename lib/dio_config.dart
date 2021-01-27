import 'package:dio/dio.dart';

class DioConfig {
  static Dio dio;
  static const String KEY_AUTH = 'Authorization';
  static Dio get () {
    if (dio == null) {
      dio = new Dio();
      dio.options.connectTimeout = 5000;
      dio.options.receiveTimeout = 3000;
      dio.options.contentType = "application/json";
      dio.options.baseUrl = "http://api.etanee.id";
    }
    return dio;
  }
  
  static void setToken(String token){
    if (dio == null) get ();
    Map headers = dio.options.headers;
    headers[KEY_AUTH] = token;
    dio.options.headers = headers;
  }

  static String getToken() {
    if (dio == null) get();
    Map headers = dio.options.headers;
    return headers[KEY_AUTH];
  }

  static void clearToken() {
    if (dio == null) get ();
    Map headers = dio.options.headers;
    headers.remove(KEY_AUTH);
    dio.options.headers = headers;
  }
}