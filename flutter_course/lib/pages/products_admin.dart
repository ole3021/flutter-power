import 'package:flutter/material.dart';

import './products.dart';

class ProductsAdminPage extends StatelessWidget {
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProductsPage()));
              },
              title: Text('Products'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Course APP"),
      ),
      body: Center(
        child: Text('Admin Page'),
      ),
    );
  }
}
