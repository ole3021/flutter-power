import 'package:flutter/material.dart';

import '../products_manager.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, String>> products;

  ProductsPage({this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/admin');
              },
              title: Text('Manage Products'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Course APP"),
      ),
      body: ProductsManager(
        products: products,
      ),
    );
  }
}
