import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/models/product.dart';
import 'package:sample_app/utils/text_styles.dart';

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
              child: Image.network(
                product.ossUrl,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                  vertical: ScreenUtil().setWidth(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyles.body1,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '销量：${product.saleAmount}',
                      style: TextStyle(
                        color: Color(0xFFAAA9A9),
                        fontSize: ScreenUtil().setSp(22),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '￥${product.sellPrice}',
                            style: TextStyle(
                              color: Color(0xFFFF5454),
                            ),
                          ),
                          Container(
                            width: ScreenUtil().setWidth(80),
                            height: ScreenUtil().setWidth(45),
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
                                  fontSize: ScreenUtil().setSp(25),
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