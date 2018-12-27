import 'package:flutter/material.dart';

class ProductAdminCreate extends StatefulWidget {
  final Function addProduct;

  ProductAdminCreate({
    this.addProduct,
  });

  @override
  State<StatefulWidget> createState() {
    return _ProductAdminCreateState();
  }
}

class _ProductAdminCreateState extends State<ProductAdminCreate> {
  String _title = '';
  String _description = '';
  final TextEditingController _ctlTitle = TextEditingController();
  final TextEditingController _ctlDescription = TextEditingController();
  final TextEditingController _ctlPrice = TextEditingController();
  double _price = 0.0;

  void _addNewProduct(BuildContext context) {
    final Map<String, String> newProduct = {
      'title': _title,
      'imageUrl': 'assets/food.jpg',
      'description': _description,
      'price': _price.toString()
    };

    widget.addProduct(newProduct);

    setState(() {
      _title = '';
      _description = '';
      _price = 0.0;
    });
    _ctlTitle.text = '';
    _ctlDescription.text = '';
    _ctlPrice.text = '';

    _showCreatedMessage(context);
  }

  void _showCreatedMessage(BuildContext content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Created Item'),
            content: Text('The item has been created successfully!'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  List<Widget> _buildCreateForm() {
    return [
      TextField(
        controller: _ctlTitle,
        decoration: InputDecoration(labelText: 'Title'),
        autofocus: true,
        onChanged: (String value) {
          setState(() {
            _title = value;
          });
        },
      ),
      TextField(
        controller: _ctlDescription,
        decoration: InputDecoration(labelText: 'Description'),
        maxLines: 4,
        onChanged: (String value) {
          setState(() {
            _description = value;
          });
        },
      ),
      TextField(
        controller: _ctlPrice,
        decoration: InputDecoration(labelText: 'Price'),
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          setState(() {
            _price = double.parse(value);
          });
        },
      ),
      SizedBox(
        height: 50,
      ),
      RaisedButton(
        color: Theme.of(context).accentColor,
        textColor: Colors.white,
        onPressed: () => _addNewProduct(context),
        child: Text('Save'),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        child: ListView(
          children: _buildCreateForm(),
        ));
  }
}
