import 'package:flutter/material.dart';

import '../sessions/products/products_admin_create.dart';
import '../sessions/products/products_admin_manage.dart';

class ProductsAdminPage extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductsAdminPage({this.products, this.addProduct, this.deleteProduct});

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
              Navigator.pushReplacementNamed(context, '/products');
            },
            leading: Icon(Icons.shopping_basket),
            title: Text('Products'),
          )
        ],
      ),
    );
  }

  List<Widget> _buildMenuTab() {
    return [
      Tab(
        icon: Icon(Icons.create),
        text: 'Create Product',
      ),
      Tab(icon: Icon(Icons.list), text: 'My Products'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: _buildDrawer(context),
            appBar: AppBar(
              title: Text("Course APP"),
              bottom: TabBar(
                tabs: _buildMenuTab(),
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
