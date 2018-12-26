import 'package:flutter/material.dart';

import '../products_manager.dart';
import './products_admin.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductsPage({this.products, this.addProduct, this.deleteProduct});

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
        addProduct: addProduct,
        deleteProduct: deleteProduct,
      ),
    );
  }
}
