import 'package:flutter/material.dart';

import './products.dart';
import './products_control.dart';

class ProductsManager extends StatefulWidget {
  final Map<String, String> initProducts;

  ProductsManager({this.initProducts}) {
    print('>>> [Products Manager] - Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('>>> [Products Manager] - createState ');
    return _ProductsStatus();
  }
}

class _ProductsStatus extends State<ProductsManager> {
  final List<Map<String, String>> _products = [];

  @override
  void initState() {
    if (widget.initProducts != null) {
      print('>>> [Products Manager State] - initState');
      _products.add(widget.initProducts);
    }

    super.initState();
  }

  @override
  void didUpdateWidget(ProductsManager oldWidget) {
    print('>>> [Products Manager State] - didUpdate');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
      print('>>> [Products Manager Stat] Updated Products');
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
    print('>>> [Products Manager State] - build');
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        Expanded(
            child: Products(
          products: _products,
          deleteProduct: _deleteProduct,
        ))
      ],
    );
  }
}
