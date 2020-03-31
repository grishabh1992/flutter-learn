import 'package:flutter/material.dart';

class Item {
  String name;
  Widget screen;

  Item.formObject(dynamic o) {
    this.name = o['name'];
    this.screen = o['screen'];
  }
}