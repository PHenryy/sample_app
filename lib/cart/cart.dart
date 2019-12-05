import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoped_model/scoped_model.dart';
import '../widgets/base_app_bar.dart';
import './cart_item_template.dart';
import './cart_model.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: ScopedModel<CartModel>(
        model: CartModel(),
        child: ScopedModelDescendant<CartModel>(
          builder: (context, child, model) {
            bool isAllSelected =
                model.cartList.every((item) => item.isSelected);

            return Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.fromLTRB(
                    0,
                    ScreenUtil.getInstance().setWidth(30),
                    ScreenUtil.getInstance().setWidth(33),
                    ScreenUtil.getInstance().setWidth(30),
                  ),
                  child: Text(
                    '编辑',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(28.0),
                      color: Color(0xFF999999),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) =>
                        CartItemTemplate(
                      cartItem: model.cartList[index],
                    ),
                    itemCount: model.cartList.length,
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: ScreenUtil.getInstance().setHeight(100.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (bool value) {
                                      if (value) {
                                        model.selectAll();
                                      } else {
                                        model.unSelectAll();
                                      }
                                      model.caculateTotalPrice();
                                    },
                                    value: isAllSelected,
                                  ),
                                  SizedBox(
                                    width:
                                        ScreenUtil.getInstance().setWidth(21.0),
                                  ),
                                  Text(
                                    '全选',
                                    style: TextStyle(
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(29.0),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '合计：￥${model.totalPrice}',
                                    style: TextStyle(
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(29.0),
                                      color: Color(0xFFE6433F),
                                    ),
                                  ),
                                  Text(
                                    '不含运费',
                                    style: TextStyle(
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(24.0),
                                      color: Color(0xFFBDBDBD),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      MaterialButton(
                        color: Theme.of(context).primaryColor,
                        minWidth: ScreenUtil.getInstance().setWidth(238.0),
                        height: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        elevation: 0,
                        onPressed: () {},
                        child: Text(
                          '去结算',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil.getInstance().setSp(32.0),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
