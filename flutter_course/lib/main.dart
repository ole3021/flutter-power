import 'package:flutter/material.dart';

import './products_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
          accentColor: Colors.deepOrange),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Course APP"),
        ),
        body: ProductsManager(initProducts: 'Some Food'),
      ),
    );
  }
}
