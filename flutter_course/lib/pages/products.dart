import 'package:flutter/material.dart';

import '../sessions/products/products_list.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, String>> products;

  ProductsPage({this.products});

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
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
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
      appBar: AppBar(
        title: Text("Course APP"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          )
        ],
      ),
      body: ProductsList(
        products: products,
      ),
    );
  }
}
