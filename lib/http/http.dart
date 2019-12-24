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
    _http.interceptors.add(LogInterceptor(responseBody: false));
    return _http;
  }

  Http._internal() : super(baseOptions);
}
