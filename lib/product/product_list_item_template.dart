import 'package:flutter/material.dart';
import 'package:sample_app/models/product.dart';

class ProductListItemTemplate extends StatelessWidget {
  ProductListItemTemplate({this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/product', arguments: product);
      },
      child: Container(
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
      ),
    );
  }
}
