import 'package:flutter/material.dart';

class ProductAdminEdit extends StatefulWidget {
  final int index;
  final Map<String, String> product;
  final Function addProduct;
  final Function editProduct;
  final Function deleteProduct;

  ProductAdminEdit({
    this.index,
    this.product,
    this.addProduct,
    this.editProduct,
    this.deleteProduct,
  });

  @override
  State<StatefulWidget> createState() {
    return _ProductAdminEditState();
  }
}

class _ProductAdminEditState extends State<ProductAdminEdit> {
  final Map<String, String> _formData = {
    "title": null,
    'imageUrl': 'assets/food.jpg',
    "description": null,
    "price": null
  };
  final GlobalKey<FormState> _productCreateFrom = GlobalKey<FormState>();

  final TextEditingController _ctlTitle = TextEditingController();
  final TextEditingController _ctlDescription = TextEditingController();
  final TextEditingController _ctlPrice = TextEditingController();

  void _submitCreateForm(BuildContext context) {
    if (!_productCreateFrom.currentState.validate()) {
      return;
    }

    _productCreateFrom.currentState.save();

    if (widget.product == null) {
      widget.addProduct(_formData);

      _ctlTitle.text = '';
      _ctlDescription.text = '';
      _ctlPrice.text = '';

      _showCreatedMessage(context);
    } else {
      widget.editProduct(widget.index, _formData);
    }
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

  Form _buildCreateForm() {
    return Form(
      key: _productCreateFrom,
      child: ListView(children: [
        TextFormField(
          controller: _ctlTitle,
          decoration: InputDecoration(labelText: 'Title'),
          autofocus: widget.product == null ? true : false,
          validator: (String value) {
            if (value.isEmpty || value.length < 5) {
              return 'Title is required and should be 5+ character long!';
            }
          },
          onSaved: (String value) {
            _formData["title"] = value;
          },
        ),
        TextFormField(
          controller: _ctlDescription,
          decoration: InputDecoration(labelText: 'Description'),
          maxLines: 4,
          onSaved: (String value) {
            _formData["description"] = value;
          },
        ),
        TextFormField(
          controller: _ctlPrice,
          decoration: InputDecoration(labelText: 'Price'),
          keyboardType: TextInputType.number,
          validator: (String value) {
            if (value.isEmpty ||
                !RegExp(r'^(?:[1-9]\d|0)?(?:\.\d+)?$').hasMatch(value)) {
              return 'Price is not correct.';
            }
          },
          onSaved: (String value) {
            _formData["price"] = double.parse(value).toString();
          },
        ),
        SizedBox(
          height: 50,
        ),
        RaisedButton(
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          onPressed: () => _submitCreateForm(context),
          child: Text('Save'),
        )
      ]),
    );
  }

  @override
  void initState() {
    _ctlTitle.text = widget.product == null ? '' : widget.product["title"];
    _ctlDescription.text =
        widget.product == null ? '' : widget.product["description"];
    _ctlPrice.text = widget.product == null ? '' : widget.product["price"];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageContent = Container(
        margin: EdgeInsets.all(15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: _buildCreateForm(),
        ));
    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Item'),
            ),
            body: pageContent);
  }
}
