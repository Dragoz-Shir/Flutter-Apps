import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 60.0;
  double _height = 60.0;

  BorderRadiusGeometry _border = BorderRadius.circular(8.0);
  Color _color = Colors.amberAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _border, color: _color),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cambiar,
        child: Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _cambiar() {
    setState(() {
      _width = (Random().nextDouble() * 300);
      _height = (Random().nextDouble() * 300);
      _border = BorderRadius.circular(Random().nextInt(30).toDouble());
      int r = Random().nextInt(255);
      int g = Random().nextInt(255);
      int b = Random().nextInt(255);

      _color = Color.fromRGBO(r, g, b, 1);
    });
  }
}
