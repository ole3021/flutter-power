import 'package:flutter/material.dart';

import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Products({this.products, this.deleteProduct}) {
    print('>>> [Products Widget] - Constructor');
  }

  Widget _buildProductsItem(BuildContext context, int index) => Card(
        child: Column(
          children: <Widget>[
            Image.asset(products[index]['imageUrl']),
            Text(products[index]['title']),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Read More'),
                  color: Theme.of(context).secondaryHeaderColor,
                  onPressed: () => Navigator.pushNamed<bool>(
                              context, '/product/' + index.toString())
                          .then((bool isDeleted) {
                        if (isDeleted) {
                          deleteProduct(index);
                        }
                      }),
                )
              ],
            )
          ],
        ),
      );

  Widget _buildProductsList() {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: _buildProductsItem,
            itemCount: products.length,
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    print('>>> [Products Widget] - build');
    return _buildProductsList();
  }
}
