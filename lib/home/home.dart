import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/models/nav.dart';
import 'package:sample_app/templates/nav_template.dart';
import 'package:sample_app/widgets/base_app_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sample_app/widgets/text_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/product/product.dart';
import 'package:sample_app/product/product_list_item_template.dart';

const List<Nav> _navs = const <Nav>[
  const Nav(label: '活动专区', icon: Icons.ac_unit),
  const Nav(label: '商品分类', icon: Icons.ac_unit),
  const Nav(label: '积分商城', icon: Icons.ac_unit),
  const Nav(label: '合作机构', icon: Icons.ac_unit),
  const Nav(label: '防伪查询', icon: Icons.ac_unit),
  const Nav(label: '媓钻风采', icon: Icons.ac_unit),
  const Nav(label: '专家问诊', icon: Icons.ac_unit),
  const Nav(label: '护肤课堂', icon: Icons.ac_unit),
];

List<Product> productList = <Product>[
  Product(
    image: 'assets/images/i1.jpg',
    title: '媓钻之星 舒缓隔离防护喷雾150ml 夏季防晒必备夏季防晒必备夏季防晒必备',
    price: 188.00,
    sales: 281,
  ),
  Product(
    image: 'assets/images/i1.jpg',
    title: '媓钻之星 舒缓隔离防护喷雾150ml 夏季防晒必备',
    price: 188.00,
    sales: 281,
  ),
  Product(
    image: 'assets/images/i1.jpg',
    title: '保湿清透隔离霜 30ml',
    price: 188.00,
    sales: 281,
  ),
  Product(
    image: 'assets/images/i1.jpg',
    title: '保湿清透隔离霜 30ml',
    price: 188.00,
    sales: 281,
  ),
];

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
            Container(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
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
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width / 1.875,
                      child: new Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return new Image.asset(
                            "assets/images/i1.jpg",
                            fit: BoxFit.cover,
                          );
                        },
                        itemCount: 3,
                        pagination: new SwiperPagination(),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(23.0, 9.0, 23.0, 11.5),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '热点',
                            style: TextStyle(
                              color: Color(0xFFC33E48),
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          TextCarousel(
                            texts: [
                              '是否时代峰峻都删了复健科斯蒂芬',
                              '是否时代峰峻都删了复健科斯蒂芬',
                              '是否时代峰峻都删了复健科斯蒂芬',
                              '是否时代峰峻都删了复健科斯蒂芬',
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        physics: NeverScrollableScrollPhysics(),
                        children: _navs.map((item) {
                          return NavTemplate(
                            nav: item,
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            width: double.infinity,
                            height: 35.0,
                            margin: EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '热销产品',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Color(0xFF333333),
                              ),
                            ),
                          ),
                          GridView.count(
                            childAspectRatio: 0.64444,
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            mainAxisSpacing: 9.0,
                            crossAxisSpacing: 9.0,
                            padding: EdgeInsets.symmetric(
                              horizontal: 9.0,
                            ),
                            physics: NeverScrollableScrollPhysics(),
                            children: productList.map((item) {
                              return ProductListItemTemplate(
                                product: item,
                              );
                            }).toList(),
                          ),
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
