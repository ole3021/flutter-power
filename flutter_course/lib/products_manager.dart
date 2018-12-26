import 'package:flutter/material.dart';

import './products.dart';

class ProductsManager extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  ProductsManager({this.products, this.deleteProduct}) {
    print('>>> [Products Manager] - Constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('>>> [Products Manager State] - build');
    return Column(
      children: <Widget>[
        Expanded(
            child: Products(
          products: products,
        ))
      ],
    );
  }
}
