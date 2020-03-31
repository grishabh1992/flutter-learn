import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final double _formDistance = 10.0;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle;
    return Scaffold(
        appBar: AppBar(
          title: Text('login Screen'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
            padding: EdgeInsets.all(15.0),
            child: ListView(children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          top: _formDistance, bottom: _formDistance),
                      child: Text('Welcome to App',
                          style: Theme.of(context).textTheme.title)),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _formDistance, bottom: _formDistance),
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            hintText: 'eg. X-Man',
                            labelText: 'Username',
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _formDistance, bottom: _formDistance),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: 'eg. *********',
                            labelText: 'Password',
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        obscureText: true,
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _formDistance, bottom: _formDistance),
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        onPressed: () {
                          setState(() {
                            _login();
                          });
                        },
                        child: Text(
                          'Login',
                          textScaleFactor: 1.5,
                        ),
                      ))
                ],
              )
            ])));
  }

  void _login() async {
    passwordController.text = '';
    usernameController.text = '';
    this.navigate();
  }

  void navigate() async {
    // await Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => NotificationList()));
  }
}
