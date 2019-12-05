import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/cart/cart_model.dart';
import 'package:scoped_model/scoped_model.dart';
import './counter.dart';
import './cart_item.dart';

class CartItemTemplate extends StatefulWidget {
  CartItemTemplate({this.cartItem});

  final CartItem cartItem;

  @override
  _CartItemTemplateState createState() => _CartItemTemplateState();
}

class _CartItemTemplateState extends State<CartItemTemplate> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CartModel>(
      builder: (context, child, model) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(
            ScreenUtil.getInstance().setWidth(30.0),
          ),
          margin: EdgeInsets.only(
            bottom: ScreenUtil.getInstance().setWidth(20.0),
          ),
          child: Row(
            children: <Widget>[
              Checkbox(
                onChanged: (bool value) {
                  setState(() {
                    widget.cartItem.toggleSelectStatus();
                    model.caculateTotalPrice();
                  });
                },
                value: widget.cartItem.isSelected,
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(30.0),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(160.0),
                height: ScreenUtil.getInstance().setHeight(160.0),
                child: Image.asset(
                  widget.cartItem.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(30.0),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.cartItem.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(76.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('￥${widget.cartItem.price}'),
                        Counter(
                          onChange: (count) {
                            widget.cartItem.setQuantity(count);
                            model.caculateTotalPrice();
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
