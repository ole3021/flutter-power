import 'package:flutter/material.dart';

import './pages/auth.dart';
import './pages/products.dart';
import './pages/product.dart';
import './pages/products_admin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, String>> _products = [];

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
      print('>>> [Products Manager Stat] Updated Products - Add');
      print(_products);
    });
  }

  void _editProduct(int index, Map<String, String> product) {
    setState(() {
      _products[index] = product;
      print('>>> [Products Manager Stat] Updated Products - Edit');
      print(_products);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
      print('>>> [Products Manager Stat] Deleted Products');
      print(_products);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        accentColor: Colors.deepOrange,
        fontFamily: 'Orbitron',
      ),

      home: AuthPage(),
      // The / routes is not allowed to configed
      routes: {
        '/auth': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => ProductsPage(
              products: _products,
            ),
        '/product': (BuildContext context) => ProductPage(),
        '/admin': (BuildContext context) => ProductsAdminPage(
              products: _products,
              addProduct: _addProduct,
              editProduct: _editProduct,
              deleteProduct: _deleteProduct,
            )
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');

        if (pathElements[0] != '') {
          return null;
        }

        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(
                  title: _products[index]['title'],
                  imageUrl: _products[index]['imageUrl']));
        }

        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(
                  products: _products,
                ));
      },
    );
  }
}
