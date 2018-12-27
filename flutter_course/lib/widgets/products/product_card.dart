import 'package:flutter/material.dart';

import './price_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, String> product;
  final int index;

  ProductCard({this.product, this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['imageUrl']),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    size: 40,
                    color: Colors.red,
                  ),
                  onPressed: () => Navigator.pushNamed<bool>(
                      context, '/product/' + index.toString()),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        product['title'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      PriceTag(price: product['price']),
                    ],
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.info_outline,
                        size: 40,
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () => Navigator.pushNamed<bool>(
                          context, '/product/' + index.toString()),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(border: Border.all()),
            child: Row(
              children: <Widget>[
                Text(
                  product['description'],
                  style: TextStyle(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
