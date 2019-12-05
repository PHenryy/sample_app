import 'package:flutter/material.dart';
import '../home/home.dart';
import '../screens/products.dart';
import '../cart/cart.dart';
import '../user/user.dart';
import '../widgets/icecons_icons.dart';

class BottomNavation extends StatefulWidget {
  @override
  _BottomNavationState createState() => _BottomNavationState();
}

class _BottomNavationState extends State<BottomNavation> {
  final _navBarColorDefault = Color(0xFFCCCCCC);
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Home(),
    Products(),
    Cart(),
    User(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFFFFF),
        iconSize: 22.5,
        currentIndex: _currentIndex,
        onTap: _onTapTapped,
        showUnselectedLabels: true,
        unselectedItemColor: _navBarColorDefault,
        selectedItemColor: Theme.of(context).primaryColor,
        selectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(
              Icecons.like,
            ),
            title: Padding(
              padding: const EdgeInsets.only(
                top: 1.5,
              ),
              child: Text(
                '首页',
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icecons.like,
            ),
            title: Padding(
              padding: const EdgeInsets.only(
                top: 1.5,
              ),
              child: Text(
                '全部商品',
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icecons.like,
            ),
            title: Padding(
              padding: const EdgeInsets.only(
                top: 1.5,
              ),
              child: Text(
                '购物车',
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icecons.like,
            ),
            title: Padding(
              padding: const EdgeInsets.only(
                top: 1.5,
              ),
              child: Text(
                '我的',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapTapped(int index) {
    setState(() {
      this._currentIndex = index;
    });
  }
}
