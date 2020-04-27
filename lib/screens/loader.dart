import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/loader.dart';

class LoaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text('Flutter Learning App'))),
        body: Center(
          child: Loader(),
        ));
  }
}
