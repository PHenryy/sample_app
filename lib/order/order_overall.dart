import 'package:flutter/material.dart';
import 'package:sample_app/widgets/base_app_bar.dart';

class OrderOverall extends StatefulWidget {
  @override
  _OrderOverallState createState() => _OrderOverallState();
}

class _OrderOverallState extends State<OrderOverall>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                text: '翼支付',
              ),
              Tab(
                text: '已完成',
              ),
              Tab(
                text: '未完成',
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
