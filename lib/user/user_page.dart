import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/home/nav/nav.dart';
import 'package:sample_app/utils/text_styles.dart';
import 'package:sample_app/widgets/arc_clipper.dart';
import 'package:sample_app/widgets/base_app_bar.dart';
import 'package:sample_app/widgets/base_header.dart';

class DailyBonus {
  DailyBonus({this.point, this.received});

  int point;
  bool received;
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Nav> _navTools = <Nav>[
      Nav(title: 'xxxx', ossUrl: ''),
      Nav(title: 'xxxx', ossUrl: ''),
      Nav(title: 'xxxx', ossUrl: ''),
      Nav(
        title: '收货地址',
        ossUrl: '',
      ),
      Nav(title: 'xxxx', ossUrl: ''),
      Nav(title: 'xxxx', ossUrl: ''),
    ];

    List<OrderNavItem> _orderNavs = <OrderNavItem>[
      OrderNavItem(
        label: 'XXXX',
      ),
      OrderNavItem(
        label: 'XXXX',
      ),
      OrderNavItem(
        label: 'XXXX',
      ),
      OrderNavItem(
        label: 'XXXX',
      ),
      OrderNavItem(
        label: 'XXXX',
      ),
    ];

    return Scaffold(
      appBar: BaseAppBar(
        trailing: IconButton(
          color: Colors.white,
          icon: Icon(Icons.settings),
          onPressed: () {
            print('click');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // 用户面板
            Container(
              height: ScreenUtil().setHeight(285.0),
              width: double.infinity,
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: ClipPath(
                      clipper: ArcClipper(),
                      child: Container(
                        height: double.infinity,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: ScreenUtil().setWidth(36.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: ScreenUtil().setHeight(285.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Wrap(
                            direction: Axis.vertical,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: <Widget>[
                              Text(
                                '余额',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(26.0),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(20.0),
                              ),
                              Text(
                                '0.00',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(26.0),
                                  color: Color(0xFFFEEE21),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(18.0),
                              ),
                              Container(
                                width: ScreenUtil().setWidth(100.0),
                                height: ScreenUtil().setHeight(44.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(20.5),
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      '明细',
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(22.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Wrap(
                            direction: Axis.vertical,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                radius: ScreenUtil().setWidth(54.0),
                                backgroundColor: Colors.grey,
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(20.0),
                              ),
                              Text(
                                '媓钻',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(26.0),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(18.0),
                              ),
                              Text(
                                '普通会员',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(22.0),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setWidth(10.0),
                              ),
                            ],
                          ),
                          Wrap(
                            direction: Axis.vertical,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: <Widget>[
                              Text(
                                '积分',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(26.0),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(20.0),
                              ),
                              Text(
                                '0.00',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(26.0),
                                  color: Color(0xFFFEEE21),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(18.0),
                              ),
                              Container(
                                width: ScreenUtil().setWidth(100.0),
                                height: ScreenUtil().setHeight(44.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(20.5),
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      '兑换',
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(22.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setWidth(6.0),
            ),
            // 签到
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: ScreenUtil().setWidth(38.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: ScreenUtil().setWidth(11.0),
                        ),
                        Icon(
                          Icons.access_time,
                          size: ScreenUtil().setWidth(36.0),
                          color: Color(0xFF888888),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(7.0),
                        ),
                        Text(
                          '签到送面膜',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(28.0),
                            color: Color(0xFF888888),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: ScreenUtil().setWidth(28.0)),
                    height: ScreenUtil().setWidth(210.0),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: ScreenUtil().setWidth(26.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: ScreenUtil().setWidth(10.0),
                            color: Color(0xFFEEEEEE),
                          ),
                        ),
                        new DailyBonusScrollView(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 我的订单
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(
                top: ScreenUtil().setWidth(20.0),
              ),
              child: Column(
                children: <Widget>[
                  FLListTile(
                    title: Text('我的订单'),
                    trailing: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Text('查看全部'),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/orderOverall');
                    },
                  ),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(186.0),
                    child: Row(
                      children: _orderNavs.map((item) {
                        return OrderNavItemTemplate(
                          orderNavItem: item,
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            // 必备工具
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(
                top: ScreenUtil().setWidth(20.0),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setWidth(86.0),
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(22.0),
                      right: ScreenUtil().setWidth(30.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '必备工具',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(28.0),
                            color: Color(0xFF3A3A3A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  // SizedBox(
                  //   height: ScreenUtil().setWidth(400.0),
                  //   child: GridView.count(
                  //     childAspectRatio: 5 / 4,
                  //     crossAxisCount: 3,
                  //     physics: NeverScrollableScrollPhysics(),
                  //     children: _navTools.map((item) {
                  //       return NavWidget(
                  //         nav: item,
                  //       );
                  //     }).toList(),
                  //   ),
                  // )
                ],
              ),
            ),
            // 版权
            Container(
              padding: EdgeInsets.only(
                bottom: ScreenUtil().setWidth(25.0),
              ),
              color: Colors.white,
              child: Center(
                child: Text('版权所有（c)媓钻官方商城'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderNavItem {
  OrderNavItem({
    this.label,
    this.icon = Icons.access_alarm,
  });

  final IconData icon;
  final String label;
}

class OrderNavItemTemplate extends StatelessWidget {
  OrderNavItemTemplate({
    this.orderNavItem,
  });

  final OrderNavItem orderNavItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              orderNavItem.icon,
              size: ScreenUtil().setWidth(45.0),
              color: Color(0xFF666666),
            ),
            SizedBox(
              height: ScreenUtil().setWidth(38.0),
            ),
            Text(
              orderNavItem.label,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(22.0),
                color: Color(0xFF666666),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DailyBonusScrollView extends StatelessWidget {
  const DailyBonusScrollView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 90,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(3.0),
          ),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  shape: BoxShape.circle,
                ),
                width: ScreenUtil().setWidth(62.0),
                height: ScreenUtil().setWidth(62.0),
                child: Center(
                  child: Text(
                    '+1',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20.0),
                      color: Color(0xFF3A3A3A),
                    ),
                  ),
                ),
              ),
              Text(
                '$index天',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(23.0),
                  color: Color(0xFFA0A0A0),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setWidth(8.0),
                ),
                width: ScreenUtil().setWidth(97.0),
                height: ScreenUtil().setWidth(46.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFEDEDED),
                    width: ScreenUtil().setWidth(2.0),
                  ),
                  borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(5.0),
                  ),
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      '待签',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(24.0),
                        color: Color(0xFFA0A0A0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
