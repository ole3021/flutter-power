import 'package:flutter/material.dart';

import './products_admin_edit.dart';

class ProductAdminManage extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function editProduct;
  final Function deleteProduct;

  ProductAdminManage({this.products, this.editProduct, this.deleteProduct});

  Widget _builderOfProductsItem(BuildContext context, int index) => ListTile(
        leading: Image.asset(
          products[index]['imageUrl'],
          height: 50,
        ),
        title: Text(products[index]['title']),
        trailing: IconButton(
            icon: Icon(Icons.edit),
            color: Theme.of(context).accentColor,
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => ProductAdminEdit(
                    index: index,
                    product: products[index],
                    editProduct: editProduct,
                    deleteProduct: deleteProduct)))),
      );

  void _showWarningDialog(BuildContext context, int index) {
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
    return products.length > 0
        ? ListView.builder(
            itemBuilder: _builderOfProductsItem,
            itemCount: products.length,
          )
        : Container();
  }
}
