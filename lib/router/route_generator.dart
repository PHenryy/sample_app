import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/home/home.dart';
import 'package:sample_app/product/product.dart';
import 'package:sample_app/widgets/base_app_bar.dart';
import 'package:sample_app/product/product_detail.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/home':
        return CupertinoPageRoute(builder: (_) => Home());
      case '/product':
        if (args is Product) {
          return CupertinoPageRoute(builder: (_) => ProductDetail(args));
        }
        return _errorRoute();
      // Validation of correct data type
      // if (args is String) {
      //   return MaterialPageRoute(
      //     builder: (_) => Product(
      //       data: args,
      //     ),
      //   );
      // }
      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: BaseAppBar(),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
