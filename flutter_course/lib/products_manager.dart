import 'package:flutter/material.dart';

import './products.dart';
import './products_control.dart';

class ProductsManager extends StatefulWidget {
  final String initProducts;

  ProductsManager({this.initProducts = 'Default Food'}) {
    print('>>> [Products Manager] - Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('>>> [Products Manager] - createState ');
    return _ProductsStatus();
  }
}

class _ProductsStatus extends State<ProductsManager> {
  final List<String> _products = [];

  @override
  void initState() {
    print('>>> [Products Manager State] - initState');
    _products.add(widget.initProducts);
    super.initState();
  }

  @override
  void didUpdateWidget(ProductsManager oldWidget) {
    print('>>> [Products Manager State] - didUpdate');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(String product) {
    setState(() {
      _products.add(product);
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
        Products(_products)
      ],
    );
  }
}
