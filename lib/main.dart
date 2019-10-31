import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(home: Home()),
    );

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is title!"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        child: Text("TEST"),
        padding: EdgeInsets.all(20.0),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
