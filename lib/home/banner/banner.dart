import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sample_app/http/http.dart';

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
        print(snapshot);
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.width / 1.875,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.width / 1.875,
                child: Center(
                  child: Text(snapshot.data.error),
                ),
              );
            }
            return SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.width / 1.875,
              child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    snapshot.data.results[index].ossUrl,
                    fit: BoxFit.cover,
                  );
                },
                itemCount: snapshot.data.results.length,
                pagination: new SwiperPagination(),
              ),
            );
        }
      },
    );
  }
}

class Banner {
  final String ossUrl;

  Banner(this.ossUrl);
  Banner.fromJson(Map<String, dynamic> json) : ossUrl = json['oss_url'];
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
