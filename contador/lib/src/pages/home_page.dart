import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final stiloTexto = new TextStyle(fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Contador"),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Número de Holis: ",
              style: stiloTexto,
            ),
            Text(
              "0",
              style: stiloTexto,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("holi +1");
        },
        child: Icon(Icons.add),
        elevation: 20.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
