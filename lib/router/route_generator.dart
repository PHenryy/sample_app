import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/home/home.dart';
import 'package:sample_app/order/order_detail.dart';
import 'package:sample_app/order/order_pay.dart';
import 'package:sample_app/order/order_pay_method.dart';
import 'package:sample_app/order/order_refund.dart';
import 'package:sample_app/order/order_refund_result.dart';
import 'package:sample_app/order/pay_result.dart';
import 'package:sample_app/order/tracking_number.dart';
import 'package:sample_app/user/edit_user_address.dart';
import 'package:sample_app/user/user_addresses.dart';
import 'package:sample_app/widgets/base_app_bar.dart';
import 'package:sample_app/product/product_detail_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/home':
        return CupertinoPageRoute(builder: (_) => Home());
      case '/product':
        if (args is int) {
          return CupertinoPageRoute(builder: (_) => ProductDetailPage(args));
        }
        return _errorRoute();
      case '/orderPay':
        return CupertinoPageRoute(builder: (_) => OrderPay());
      case '/orderPayMethod':
        return CupertinoPageRoute(builder: (_) => OrderPayMethod());
      case '/payResult':
        return CupertinoPageRoute(builder: (_) => PayResult());
      case '/orderDetail':
        return CupertinoPageRoute(builder: (_) => OrderDetail());
      case '/orderRefund':
        return CupertinoPageRoute(builder: (_) => OrderRefund());
      case '/orderRefundResult':
        return CupertinoPageRoute(builder: (_) => OrderRefundResult());
      case '/trackingNumber':
        return CupertinoPageRoute(builder: (_) => TrackingNumber());
      case '/user/addresses':
        return CupertinoPageRoute(builder: (_) => UserAddresses());
      case '/user/address/edit':
        return CupertinoPageRoute(builder: (_) => EditUserAddress());
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
