import 'dart:math';
import 'dart:math';
import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation_rotation;
  Animation<double> animation_redius_in;
  Animation<double> animation_radius_out;
  final double initialRadius = 30;
  double radius = 0.0;
  double smallRadius = 7.0;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation_rotation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 1.0, curve: Curves.linear)));
    animation_redius_in = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.75, 1.0, curve: Curves.elasticIn)));
    animation_radius_out = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = animation_redius_in.value * initialRadius;
        } else if (controller.value >= 0.0 && controller.value <= 0.75) {
          radius = animation_radius_out.value * initialRadius;
        }
      });
    });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Center(
          child: RotationTransition(
        turns: animation_rotation,
        child: Stack(children: <Widget>[
          Dot(color: Colors.black12, radius: 20.0),
          Transform.translate(
              offset: Offset(radius * cos(pi), radius * sin(pi)),
              child: Dot(color: Colors.redAccent, radius: smallRadius)),
          Transform.translate(
              offset: Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
              child: Dot(color: Colors.greenAccent, radius: smallRadius)),
          Transform.translate(
              offset: Offset(radius * cos(pi / 2), radius * sin(pi / 2)),
              child: Dot(color: Colors.blueAccent, radius: smallRadius)),
          Transform.translate(
              offset:
                  Offset(radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
              child: Dot(color: Colors.amberAccent, radius: smallRadius)),
          Transform.translate(
              offset:
                  Offset(radius * cos(4 * pi / 4), radius * sin(4 * pi / 4)),
              child: Dot(color: Colors.blue, radius: smallRadius)),
          Transform.translate(
              offset:
                  Offset(radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
              child: Dot(color: Colors.orangeAccent, radius: smallRadius)),
          Transform.translate(
              offset:
                  Offset(radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
              child: Dot(color: Colors.lightGreenAccent, radius: smallRadius)),
          Transform.translate(
              offset:
                  Offset(radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
              child: Dot(color: Colors.limeAccent, radius: smallRadius)),
          Transform.translate(
              offset:
                  Offset(radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
              child: Dot(color: Colors.tealAccent, radius: smallRadius)),
        ]),
      )),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: this.radius,
      height: this.radius,
      decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
    ));
  }
}
