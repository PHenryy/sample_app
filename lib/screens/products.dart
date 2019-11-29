import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/base_app_bar.dart';

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

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 9.0,
                  ),
                  Expanded(
                    child: MaterialButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: Color(0xFFEFEFEF),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                            '请输入关键字...',
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
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        '综合',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 24,
                    child: VerticalDivider(
                      color: Color(0xFFCACACA),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        '销量',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 24,
                    child: VerticalDivider(
                      color: Color(0xFFCACACA),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Text(
                            '价格',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF666666),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.arrow_drop_up,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 24,
                    child: VerticalDivider(
                      color: Color(0xFFCACACA),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Text(
                            '筛选',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF666666),
                            ),
                          ),
                          Icon(
                            Icons.filter_list,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    GridView.count(
                      childAspectRatio: 0.64444,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      mainAxisSpacing: 9.0,
                      crossAxisSpacing: 9.0,
                      padding: EdgeInsets.symmetric(
                        horizontal: 9.0,
                        vertical: 9.0,
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
            ),
          ],
        ));
  }
}
