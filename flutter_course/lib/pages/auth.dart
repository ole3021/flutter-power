import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _username = '';
  String _password = '';
  bool _isAccepted = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
            margin: EdgeInsets.all(15),
            child: ListView(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Username'),
                  autofocus: true,
                  onChanged: (String value) {
                    setState(() {
                      _username = value;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onChanged: (String value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                SwitchListTile(
                  value: _isAccepted,
                  onChanged: (bool isAccepted) {
                    setState(() {
                      _isAccepted = isAccepted;
                    });
                  },
                  title: Text('Accept Terms'),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/products'),
                  child: Text('Log In'),
                )
              ],
            )));
  }
}
