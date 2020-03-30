import 'package:flutter/material.dart';
import 'package:flutter_learn/screens/login.dart';

class LandingPage extends StatelessWidget {

  final items = [ 'Login Screen', 'Routing Example'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Flutter Demo App')
        )
      ),
      body : ListView.builder(
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text(this.items[position]),
              onTap: () {
                debugPrint("Tapped");
                // setState(() {
                  navigate(LoginScreen);
                // });
              }
            ),
          );
        },
        itemCount: 2,
      )
    );
  }

  navigate(className) async {
    // await Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => className()));
  }
}
