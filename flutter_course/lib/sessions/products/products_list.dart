import 'package:flutter/material.dart';

import '../../widgets/products/product_card.dart';

class ProductsList extends StatelessWidget {
  final List<Map<String, String>> products;

  ProductsList({this.products}) {
    print('>>> [Products Widget] - Constructor');
  }

  Widget _buildProductList() {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                ProductCard(product: products[index], index: index),
            itemCount: products.length,
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    print('>>> [Products Widget] - build');
    return Column(children: <Widget>[Expanded(child: _buildProductList())]);
  }
}
