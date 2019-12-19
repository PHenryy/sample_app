import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class Http extends DioForNative {
  static final Http _http = Http._internal();
  static const BASE_URL_DEV = "https://crown.hzyxhfp.com";
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: BASE_URL_DEV,
  );

  factory Http() {
    return _http;
  }

  Http._internal() : super(baseOptions) {}
}
