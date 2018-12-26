import 'package:flutter/material.dart';

import '../products_manager.dart';
import './products_admin.dart';

class ProductsPage extends StatelessWidget {
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ProductsAdminPage()));
              },
              title: Text('Manage Products'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Course APP"),
      ),
      body: ProductsManager(),
    );
  }
}
