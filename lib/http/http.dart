import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class Http extends DioForNative {
  static final Http _http = Http._internal();
  static const String BASE_URL_DEV = "https://crown.hzyxhfp.com";
  static const int CONNECT_TIMEOUT = 5000;
  static const int RECEIVE_TIMEOUT = 3000;
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: BASE_URL_DEV,
    connectTimeout: CONNECT_TIMEOUT,
    receiveTimeout: RECEIVE_TIMEOUT,
  );

  factory Http() {
    // (_http.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //   client.findProxy = (uri) {
    //     return "PROXY 10.10.162.92:8888";
    //   };
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => Platform.isAndroid;
    // };
    // _http.interceptors.add(LogInterceptor(
    //   responseBody: true,
    //   requestBody: true,
    // ));
    _http.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        String token =
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2Nyb3duLmh6eXhoZnAuY29tL2FwaS9sb2dpbiIsImlhdCI6MTU3NzY5ODUzOCwiZXhwIjoxNTc3ODc4NTM4LCJuYmYiOjE1Nzc2OTg1MzgsImp0aSI6IlZqNTBYU0xYOUExYnc1TkIiLCJzdWIiOjUxLCJwcnYiOiJjNzdlYWJjNmQyOWRiY2UwYjU1ZTk4YmRlYzM5MWI1NDlhNWVmMWYwIn0.ttgyyL5QOeFrq3XAkqckyIwwl8lCnNcbSHvTzHJAXV8';
        options.headers['Authorization'] = token;
        return options;
      },
    ));
    return _http;
  }

  Http._internal() : super(baseOptions);
}
