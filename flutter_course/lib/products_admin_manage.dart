import 'package:flutter/material.dart';

class ProductAdminManage extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  ProductAdminManage({this.products, this.deleteProduct});

  Widget _buildProductsItem(BuildContext context, int index) => Card(
        child: Column(
          children: <Widget>[
            Image.asset(products[index]['imageUrl']),
            Text(products[index]['title']),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Delete'),
                  color: Theme.of(context).secondaryHeaderColor,
                  onPressed: () => _showWarningDialog(context, index),
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

  _showWarningDialog(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete Item'),
            content: Text('The deleted item cannot be undone!'),
            actions: <Widget>[
              FlatButton(
                child: Text('DISCARD'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('CONFIRM'),
                onPressed: () {
                  deleteProduct(index);
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductsList();
  }
}
