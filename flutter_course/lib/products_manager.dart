import 'package:flutter/material.dart';

import './products.dart';
import './products_control.dart';

class ProductsManager extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductsManager({this.products, this.addProduct, this.deleteProduct}) {
    print('>>> [Products Manager] - Constructor');
  }

  // @override
  // void initState() {
  //   if (widget.initProducts != null) {
  //     print('>>> [Products Manager State] - initState');
  //     _products.add(widget.initProducts);
  //   }

  //   super.initState();
  // }

  // @override
  // void didUpdateWidget(ProductsManager oldWidget) {
  //   print('>>> [Products Manager State] - didUpdate');
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
    print('>>> [Products Manager State] - build');
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(addProduct),
        ),
        Expanded(
            child: Products(
          products: products,
          deleteProduct: deleteProduct,
        ))
      ],
    );
  }
}
