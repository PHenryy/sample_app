import 'package:dio/dio.dart';
import 'package:sample_app/http/http.dart';
import 'package:sample_app/models/product_list_item.dart';

class ProductDetailResponse {
  final ProductListItem product;
  final String error;

  ProductDetailResponse({
    this.product,
    this.error,
  });

  ProductDetailResponse.fromJson(Map<String, dynamic> json)
      : product = ProductListItem.fromJson(json['data']),
        error = '';
  ProductDetailResponse.withError(String error)
      : product = null,
        error = error;
}

class ProductDetailProvider {
  final String _endPoint = '/api/goods/goodsDetail';
  final Http _http = Http();

  Future<ProductDetailResponse> getProductDetail(int productId) async {
    try {
      Response response = await _http.post(
        _endPoint,
        queryParameters: {
          "id": productId,
        },
      );
      return ProductDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ProductDetailResponse.withError("$error");
    }
  }
}
