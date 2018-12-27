import 'package:flutter/material.dart';

import './widgets/products/product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;

  Products({
    this.products,
  }) {
    print('>>> [Products Widget] - Constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('>>> [Products Widget] - build');
    return products.length > 0
        ? ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                ProductCard(product: products[index], index: index),
            itemCount: products.length,
          )
        : Container();
    ;
  }
}
