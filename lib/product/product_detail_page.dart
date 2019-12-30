import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sample_app/cart/counter.dart';
import 'package:sample_app/home/nav/nav.dart';
import 'package:sample_app/models/product.dart';
import 'package:sample_app/models/product_list_item.dart';
import 'package:sample_app/product/product_info.dart';
import 'package:sample_app/utils/paddings.dart';
import 'package:sample_app/utils/text_styles.dart';
import 'package:sample_app/widgets/base_app_bar.dart';
import 'package:sample_app/widgets/base_gutters.dart';
import 'package:sample_app/widgets/base_header.dart';

final productIntroGK = GlobalKey<_ProductIntroState>();

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage(this.id);

  final int id;

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final Color _highlightColor = Color(0xFFFF5B5A);
  final ProductDetailProvider _productDetailProvider = ProductDetailProvider();
  Future<ProductDetailResponse> _productDetailResponse;
  ProductModel _product;

  @override
  void initState() {
    super.initState();
    _productDetailResponse = _productDetailProvider.getProductDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(),
        body: FutureBuilder(
            future: _productDetailResponse,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _product = snapshot.data.product;
                return Column(
                  children: <Widget>[
                    // new BottomSheetController(),
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              // 图片
                              AspectRatio(
                                aspectRatio: 1,
                                child: Swiper(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Image.network(
                                      snapshot
                                          .data.product.banners[index].ossUrl,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                  itemCount:
                                      snapshot.data.product.banners.length,
                                  pagination: SwiperPagination(),
                                ),
                              ),
                              // 商品介绍
                              Container(
                                color: Colors.white,
                                padding: Paddings.fieldPadding,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(
                                        top: ScreenUtil().setWidth(11),
                                      ),
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth:
                                                  ScreenUtil().setWidth(600),
                                            ),
                                            child: Text(
                                              snapshot.data.product.title,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyles.body1,
                                            ),
                                          ),
                                          Wrap(
                                            direction: Axis.vertical,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                FontAwesomeIcons.shareAlt,
                                                size: ScreenUtil().setWidth(33),
                                                color: _highlightColor,
                                              ),
                                              Text(
                                                '分享',
                                                style: TextStyle(
                                                  fontSize:
                                                      ScreenUtil().setSp(24),
                                                  color: _highlightColor,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        top: ScreenUtil().setWidth(21),
                                      ),
                                      child: Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '￥ ${snapshot.data.product.sellPrice}',
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(38),
                                              color: _highlightColor,
                                            ),
                                          ),
                                          Gutters.gutter,
                                          Text(
                                            '￥ ${snapshot.data.product.originalPrice}',
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(24),
                                              color: Color(0xFF666666),
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        top: ScreenUtil().setWidth(27),
                                        bottom: ScreenUtil().setWidth(24),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            '快递：0.00~20.00',
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(21),
                                              color: Color(0xFFC2C2C2),
                                            ),
                                          ),
                                          Text(
                                            '库存：${snapshot.data.product.totalAmount}',
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(21),
                                              color: Color(0xFFC2C2C2),
                                            ),
                                          ),
                                          Text(
                                            '销量：${snapshot.data.product.saleAmount}',
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(21),
                                              color: Color(0xFFC2C2C2),
                                            ),
                                          ),
                                          Text(
                                            '发货地: ${snapshot.data.product.province} ${snapshot.data.product.city}',
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(21),
                                              color: Color(0xFFC2C2C2),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // 分割线
                                    Container(
                                      color: Color(0xFFEEEEEE),
                                      height: ScreenUtil().setWidth(1),
                                      child: Divider(),
                                    ),
                                    // 会员优惠
                                    Container(
                                      height: ScreenUtil().setWidth(80),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '会员',
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(26),
                                              color: Color(0xFF666666),
                                            ),
                                          ),
                                          SizedBox(
                                            width: ScreenUtil().setWidth(47),
                                          ),
                                          Container(
                                            height: ScreenUtil().setWidth(36),
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  ScreenUtil().setWidth(8),
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: ScreenUtil().setWidth(2),
                                                color: _highlightColor,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      ScreenUtil().setWidth(5)),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'VIP会员卡',
                                                style: TextStyle(
                                                  fontSize:
                                                      ScreenUtil().setSp(22),
                                                  color: _highlightColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: ScreenUtil().setWidth(8),
                                          ),
                                          Text(
                                            '可享受',
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(22),
                                              color: Color(0xFF666666),
                                            ),
                                          ),
                                          Text(
                                            '￥254.6',
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(22),
                                              color: _highlightColor,
                                            ),
                                          ),
                                          Text(
                                            '的价格',
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(22),
                                              color: Color(0xFF666666),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // 产品标签
                              Container(
                                color: Color(0xFFF3F3F3),
                                height: ScreenUtil().setWidth(96),
                                padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(21),
                                ),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.product.label.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.checkCircle,
                                          color: Colors.green,
                                          size: ScreenUtil().setWidth(30),
                                        ),
                                        SizedBox(
                                          width: ScreenUtil().setWidth(4),
                                        ),
                                        Text(
                                          snapshot.data.product.label[index],
                                          style: TextStyles.body1sm,
                                        ),
                                        SizedBox(
                                          width: ScreenUtil().setWidth(53),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              // 选择数量
                              BaseHeader(
                                onPressed: () {
                                  showModalProduct(
                                    context: context,
                                  );
                                },
                                title: '请选择数量',
                                trailing: Icon(
                                  FontAwesomeIcons.chevronRight,
                                  size: ScreenUtil().setWidth(24),
                                  color: Color(0xFF999999),
                                ),
                              ),
                              Gutters.verticalGutter,
                              Container(
                                child: Html(
                                  data: """
                                    ${snapshot.data.product.content}
                                  """,
                                ),
                              ),
                              Gutters.verticalGutter,
                              // 店铺
                              // Container(
                              //   color: Colors.white,
                              //   height: ScreenUtil().setWidth(130),
                              //   padding: EdgeInsets.only(
                              //     right: ScreenUtil().setWidth(44),
                              //   ),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     crossAxisAlignment: CrossAxisAlignment.center,
                              //     children: <Widget>[
                              //       Row(
                              //         crossAxisAlignment: CrossAxisAlignment.center,
                              //         children: <Widget>[
                              //           Container(
                              //             margin: EdgeInsets.only(
                              //               left: ScreenUtil().setWidth(24),
                              //               right: ScreenUtil().setWidth(19),
                              //             ),
                              //             width: ScreenUtil().setWidth(99),
                              //             height: ScreenUtil().setWidth(99),
                              //             child: Image.asset(
                              //               'assets/images/i2.jpg',
                              //               fit: BoxFit.cover,
                              //             ),
                              //           ),
                              //           Text(
                              //             '媓钻官方商城',
                              //             style: TextStyle(
                              //               fontSize: ScreenUtil().setWidth(28),
                              //               color: Color(0xFF323232),
                              //             ),
                              //           )
                              //         ],
                              //       ),
                              //       ConstrainedBox(
                              //         constraints: BoxConstraints(
                              //           maxHeight: ScreenUtil().setWidth(56),
                              //         ),
                              //         child: OutlineButton(
                              //           color: Colors.white,
                              //           borderSide: new BorderSide(
                              //             color: Color(0xFF7C7C7C),
                              //           ),
                              //           shape: OutlineInputBorder(
                              //             borderRadius: BorderRadius.circular(
                              //               ScreenUtil().setWidth(28),
                              //             ),
                              //           ),
                              //           onPressed: () {},
                              //           child: Text(
                              //             '进店逛逛',
                              //             style: TextStyle(
                              //               fontSize: ScreenUtil().setWidth(28),
                              //               color: Color(0xFF7C7C7C),
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // 操作
                    Container(
                      height: ScreenUtil().setWidth(95),
                      child: Row(children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(240),
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: Center(
                                    child: Wrap(
                                      direction: Axis.vertical,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.heart,
                                          color: Color(0xFFFD5454),
                                          size: ScreenUtil().setWidth(32),
                                        ),
                                        Text(
                                          '关注',
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(22),
                                            color: Color(0xFFFD5454),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: Center(
                                    child: Wrap(
                                      direction: Axis.vertical,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.store,
                                          color: Color(0xFFFD5454),
                                          size: ScreenUtil().setWidth(32),
                                        ),
                                        Text(
                                          '店铺',
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(22),
                                            color: Color(0xFFFD5454),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: double.infinity,
                              maxHeight: double.infinity,
                            ),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                              elevation: 0,
                              color: Color(0xFFFE940F),
                              onPressed: () {
                                showModalProduct(
                                  context: context,
                                  onConfirm: (int count) {
                                    print(count);
                                  },
                                );
                              },
                              child: Text(
                                '加入购物车',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(28),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(240),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: double.infinity,
                              maxHeight: double.infinity,
                            ),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                              elevation: 0,
                              color: Color(0xFFFD5454),
                              onPressed: () {
                                showModalProduct(
                                  context: context,
                                );
                              },
                              child: Text(
                                '立即购买',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(28),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return FLEmptyContainer(
                showLoading: true,
              );
            }));
  }

  void showModalProduct({
    BuildContext context,
    Function onConfirm,
  }) {
    int _counterFrom = 1;
    int _amountSelected = 1;

    showModalBottomSheet(
        isDismissible: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: ScreenUtil().setWidth(817),
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setWidth(56),
                  ),
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(18),
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Wrap(
                                    children: <Widget>[
                                      Container(
                                        width: ScreenUtil().setWidth(181),
                                        height: ScreenUtil().setWidth(181),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            ScreenUtil().setWidth(5),
                                          ),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              _product.banners[0].ossUrl,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          top: ScreenUtil().setWidth(84),
                                        ),
                                        margin: EdgeInsets.only(
                                          left: ScreenUtil().setWidth(24),
                                        ),
                                        child: Text(
                                          '￥ ${_product.sellPrice}',
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(32),
                                            color: Color(0xFFFF5454),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: ScreenUtil().setWidth(56),
                                      ),
                                      padding: EdgeInsets.all(
                                        ScreenUtil().setWidth(18),
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        color: Color(0xFF999999),
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   padding: EdgeInsets.only(
                                  //     top: ScreenUtil().setWidth(74),
                                  //   ),
                                  //   child: Icon(Icons.close),
                                  // ),
                                ],
                              ),
                              Divider(
                                height: ScreenUtil().setWidth(44),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(6),
                                  right: ScreenUtil().setWidth(3),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '数量',
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(28),
                                        color: Color(0xFF6E6E6E),
                                      ),
                                    ),
                                    Counter(
                                      from: _counterFrom,
                                      min: 1,
                                      max: _product.totalAmount,
                                      onChange: (int count) {
                                        _amountSelected = count;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: double.infinity,
                          minHeight: ScreenUtil().setWidth(92),
                        ),
                        child: RaisedButton(
                          onPressed: () {
                            if (onConfirm != null) {
                              onConfirm(_amountSelected);
                            }
                          },
                          color: Color(0xFFFD5454),
                          child: Text(
                            '确定',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(28),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class ProductIntro extends StatefulWidget {
  ProductIntro({Key key}) : super(key: key);

  @override
  _ProductIntroState createState() => _ProductIntroState();
}

class _ProductIntroState extends State<ProductIntro>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offset;
  CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    );
    _offset = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(_curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offset,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xFFEEEEEE),
              height: ScreenUtil().setWidth(100),
              child: Center(
                child: Text('返回商品'),
              ),
            ),
            Container(
              color: Colors.white,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('$index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void show() {
    _controller.forward();
  }

  void hide() {
    _controller.reverse();
  }
}
