import 'package:flutter/material.dart';
import 'package:iampoor/poor.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  build(context) {
    return MaterialApp(
      home: PoorPage(),
    );
  }
}
