import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sample_app/http/http.dart';
import 'package:sample_app/models/banner.dart';

class BannersWidget extends StatefulWidget {
  BannersWidget({
    Key key,
  }) : super(key: key);
  final BannerApiProvider _bannerApiProvider = BannerApiProvider();

  @override
  _BannersWidgetState createState() => _BannersWidgetState();
}

class _BannersWidgetState extends State<BannersWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget._bannerApiProvider.getBanner(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AspectRatio(
            aspectRatio: 1.875,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  snapshot.data.results[index].ossUrl,
                  fit: BoxFit.cover,
                );
              },
              itemCount: snapshot.data.results.length,
              pagination: SwiperPagination(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return Center(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.width / 1.875,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

class BannerResponse {
  final List<Banner> results;
  final String error;

  BannerResponse(this.results, this.error);

  BannerResponse.fromJson(Map<String, dynamic> json)
      : results = (json['data'] as List)
            .map((item) => Banner.fromJson(item))
            .toList(),
        error = '';

  BannerResponse.withError(String errorValue)
      : results = List(),
        error = errorValue;
}

// 播图图数据
class BannerApiProvider {
  final String _endPoint = "/api/banners?position=1";
  final Http _http = Http();

  Future<BannerResponse> getBanner() async {
    try {
      Response response = await _http.get(_endPoint);
      return BannerResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BannerResponse.withError("$error");
    }
  }
}
