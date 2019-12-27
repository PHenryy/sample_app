import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/home/product/product_list_item_template.dart';
import 'package:sample_app/http/http.dart';
import 'package:sample_app/models/product_list_item.dart';

class ProductResponse {
  final List<ProductListItemModel> products;
  final String error;

  ProductResponse({
    this.error,
    this.products,
  });

  ProductResponse.fromJson(Map<String, dynamic> json)
      : error = '',
        products = (json['data'] as List)
            .map((item) => ProductListItemModel.fromJson(item))
            .toList();

  ProductResponse.withError(String error)
      : error = error,
        products = List();
}

class ProductProvider {
  final String _endPoint = "/api/goods/lists";
  final Http _http = Http();

  Future<ProductResponse> getProducts() async {
    try {
      Response response = await _http.post(
        _endPoint,
        data: {
          "cate_id": 0,
          "pageNo": 1,
          "pagesize": 12,
        },
      );
      return ProductResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ProductResponse.withError("$error");
    }
  }
}

class HotProductsWidget extends StatefulWidget {
  final ProductProvider _productProvider = ProductProvider();

  @override
  _HotProductsWidgetState createState() => _HotProductsWidgetState();
}

class _HotProductsWidgetState extends State<HotProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget._productProvider.getProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.count(
            childAspectRatio: 0.64444,
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: ScreenUtil().setWidth(18),
            crossAxisSpacing: ScreenUtil().setWidth(18),
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(18),
            ),
            physics: NeverScrollableScrollPhysics(),
            children: snapshot.data.products.map<Widget>((item) {
              return ProductListItemTemplate(
                product: item,
              );
            }).toList(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return CircularProgressIndicator();
      },
    );
  }
}
