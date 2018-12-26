import 'package:flutter/material.dart';

import '../products_admin_create.dart';
import '../products_admin_manage.dart';

class ProductsAdminPage extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductsAdminPage({this.products, this.addProduct, this.deleteProduct});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: Drawer(
              child: Column(
                children: <Widget>[
                  AppBar(
                    automaticallyImplyLeading: false,
                    title: Text('Choose'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/products');
                    },
                    title: Text('Products'),
                  )
                ],
              ),
            ),
            appBar: AppBar(
              title: Text("Course APP"),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.create),
                    text: 'Create Product',
                  ),
                  Tab(icon: Icon(Icons.list), text: 'My Products'),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ProductAdminCreate(addProduct: addProduct),
                ProductAdminManage(
                    products: products, deleteProduct: deleteProduct)
              ],
            )));
  }
}
