import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products([this.products = const []]) {
    print('>>> [Products Widget] - Constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('>>> [Products Widget] - build');
    return Column(
        children: this
            .products
            .map((name) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/food.jpg'),
                      Text(name)
                    ],
                  ),
                ))
            .toList());
  }
}
