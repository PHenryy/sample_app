import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_app/widgets/base_app_bar.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:sample_app/widgets/text_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category {
  const Category({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Category> categories = const <Category>[
  const Category(title: '活动专区', icon: Icons.ac_unit),
  const Category(title: '商品分类', icon: Icons.ac_unit),
  const Category(title: '积分商城', icon: Icons.ac_unit),
  const Category(title: '合作机构', icon: Icons.ac_unit),
  const Category(title: '防伪查询', icon: Icons.ac_unit),
  const Category(title: '媓钻风采', icon: Icons.ac_unit),
  const Category(title: '专家问诊', icon: Icons.ac_unit),
  const Category(title: '护肤课堂', icon: Icons.ac_unit),
];

class CategoryTemplate extends StatelessWidget {
  const CategoryTemplate({Key key, this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          category.icon,
          size: 42.8,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          category.title,
          style: TextStyle(
            fontSize: 12.0,
          ),
        )
      ],
    );
  }
}

class Product {
  Product({this.image, this.title, this.price, this.sales});

  final String image;
  final String title;
  final double price;
  final int sales;
}

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

class ProductItemTemplate extends StatelessWidget {
  ProductItemTemplate({this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.96,
            child: Image.asset(
              product.image,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '销量：${product.sales}',
                    style: TextStyle(
                      color: Color(0xFFAAA9A9),
                      fontSize: 11.0,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '￥${product.price}',
                          style: TextStyle(
                            color: Color(0xFFFF5454),
                          ),
                        ),
                        Container(
                          width: 40.5,
                          height: 22.5,
                          child: FlatButton(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color(0xFFFF5454),
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(2.5)),
                            onPressed: () {},
                            child: Text(
                              '购买',
                              style: TextStyle(
                                color: Color(0xFFFF5454),
                                fontSize: 12.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 1500)..init(context);

    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Color(0xFF34BBE7));
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

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
                      child: Carousel(
                        images: [
                          AssetImage('assets/images/i1.jpg'),
                          AssetImage('assets/images/i2.jpg'),
                          AssetImage('assets/images/i3.jpg'),
                        ],
                        dotIncreaseSize: 0,
                        dotColor: Color(0xFFCCCCCC),
                        dotBgColor: Colors.transparent,
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
                        children: categories.map((item) {
                          return CategoryTemplate(
                            category: item,
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
                              '热���产品',
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
                              return ProductItemTemplate(
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
