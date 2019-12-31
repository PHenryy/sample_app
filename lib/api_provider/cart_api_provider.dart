import 'package:dio/dio.dart';
import 'package:sample_app/http/http.dart';

class CartApiProvider {
  Http _http = Http();

  Future addShopCard(dynamic data) async {
    try {
      String url = '/api/shop_card';
      Response response = await _http.post(
        url,
        data: data,
      );
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
