import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  User({this.id, this.email, this.first_name, this.last_name, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['userId'],
      id: json['id'],
      avatar: json['title'],
      first_name: json['first_name'],
      last_name: json['last_name'],
    );
  }
}

class APIPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => APIPageSTate();
}

class APIPageSTate extends State<APIPage> {
  final List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('API calling'),
        ),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                // leading: ConstrainedBox(
                //   constraints: BoxConstraints(
                //     minWidth: 44,
                //     minHeight: 44,
                //     maxWidth: 64,
                //     maxHeight: 64,
                //   ),
                //   child: Image.asset(user.avatar, fit: BoxFit.cover),
                // ),
                title: Text(user.first_name),
                subtitle: Text(user.email),
              );
            }));
  }

  void fetchUser() async {
    final http.Response response =
        await http.get('https://reqres.in/api/users?page=1');
    final Map<String, dynamic> responseData = json.decode(response.body);
    responseData['data'].forEach((userDetail) {
      final User user = User(
          first_name: userDetail['first_name'],
          last_name: userDetail['last_name'],
          id: userDetail['id'],
          avatar: userDetail['avatar'],
          email: userDetail['email']);
      setState(() {
        print(user);
        users.add(user);
      });
    });
  }
}
