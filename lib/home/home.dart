import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/home/banner/banner.dart';
import 'package:sample_app/home/nav/nav.dart';
import 'package:sample_app/home/product/hot_products.dart';
import 'package:sample_app/widgets/base_app_bar.dart';
// import 'package:sample_app/widgets/text_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/widgets/base_gutters.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    // SystemUiOverlayStyle systemUiOverlayStyle =
    //     SystemUiOverlayStyle(statusBarColor: Color(0xFF34BBE7));
    // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    return Scaffold(
      appBar: BaseAppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            SearchBarWidget(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    BannersWidget(),
                    // Container(
                    //   padding: EdgeInsets.fromLTRB(23.0, 9.0, 23.0, 11.5),
                    //   child: Row(
                    //     children: <Widget>[
                    //       Text(
                    //         '热点',
                    //         style: TextStyle(
                    //           color: Color(0xFFC33E48),
                    //           fontSize: 12.0,
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 12.0,
                    //       ),
                    //       TextCarousel(
                    //         texts: [
                    //           '是否时代峰峻都删了复健科斯蒂芬',
                    //           '是否时代峰峻都删了复健科斯蒂芬',
                    //           '是否时代峰峻都删了复健科斯蒂芬',
                    //           '是否时代峰峻都删了复健科斯蒂芬',
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    NavsWidget(),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            width: double.infinity,
                            height: ScreenUtil().setWidth(70),
                            margin: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setWidth(20),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '热销产品',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(30),
                                color: Color(0xFF333333),
                              ),
                            ),
                          ),
                          HotProductsWidget(),
                          Gutters.verticalGutter,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(24),
        vertical: ScreenUtil().setWidth(20),
      ),
      child: MaterialButton(
        elevation: 0,
        shape: StadiumBorder(),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              CupertinoIcons.search,
              color: Color(0xFFCCCCCC),
              size: 18.0,
            ),
            SizedBox(
              width: 3.5,
            ),
            Text(
              '搜索',
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFFCCCCCC),
              ),
            )
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}

// 导航图标
// /navigate/getNavList
