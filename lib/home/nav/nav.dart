import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/http/http.dart';

class Nav {
  Nav({
    this.title,
    this.ossUrl,
  });

  final String title;
  final String ossUrl;

  Nav.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        ossUrl = json['oss_url'];
}

class NavsWidget extends StatefulWidget {
  NavsWidget({
    Key key,
  }) : super(key: key);

  final NavApiProvider _navApiProvider = NavApiProvider();

  @override
  _NavsWidgetState createState() => _NavsWidgetState();
}

class _NavsWidgetState extends State<NavsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget._navApiProvider.getNavs(),
      builder: (context, snapshot) {
        print('-------------------');
        print(snapshot.data);
        print('-------------------');
        if (snapshot.hasData) {
          return Container(
            color: Colors.white,
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              physics: NeverScrollableScrollPhysics(),
              children: snapshot.data.results.map<Widget>((nav) {
                return InkWell(
                  onTap: () {
                    // Navigator.of(context).pushNamed(nav.routeName);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        nav.ossUrl,
                        width: ScreenUtil().setWidth(48),
                      ),
                      SizedBox(
                        height: ScreenUtil().setWidth(15.0),
                      ),
                      Text(
                        nav.title,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(22.0),
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return CircularProgressIndicator();
      },
    );
  }
}

class NavResponse {
  final List<Nav> results;
  final String error;

  NavResponse(this.results, this.error);

  NavResponse.fromJson(Map<String, dynamic> json)
      : results =
            (json['data'] as List).map((item) => Nav.fromJson(item)).toList(),
        error = '';

  NavResponse.withError(String errorValue)
      : results = List(),
        error = errorValue;
}

class NavApiProvider {
  final String _endPoint = "/api/navigate/getNavList";
  final Http _http = Http();

  Future<NavResponse> getNavs() async {
    try {
      Response response = await _http.post(_endPoint);
      return NavResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return NavResponse.withError("$error");
    }
  }
}
