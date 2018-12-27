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

  List<Widget> _buildLoginForm() {
    return [
      TextField(
        decoration: InputDecoration(
            labelText: 'Username',
            filled: true,
            fillColor: Colors.black.withOpacity(0.3)),
        autofocus: true,
        onChanged: (String value) {
          setState(() {
            _username = value;
          });
        },
      ),
      SizedBox(
        height: 20,
      ),
      TextField(
        decoration: InputDecoration(
            labelText: 'Password',
            filled: true,
            fillColor: Colors.black.withOpacity(0.3)),
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
        onPressed: () => Navigator.pushReplacementNamed(context, '/products'),
        child: Text('Log In'),
      )
    ];
    // Column(
    //   children: <Widget>,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.9), BlendMode.dstATop),
                    image: AssetImage('assets/back.jpg'))),
            padding: EdgeInsets.all(10),
            child: Center(
                child: SingleChildScrollView(
              child: Column(
                children: _buildLoginForm(),
              ),
            ))));
  }
}
