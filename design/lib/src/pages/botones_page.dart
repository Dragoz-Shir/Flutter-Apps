import 'package:flutter/material.dart';

import 'dart:ui';
import 'dart:math';

class BotonesPage extends StatelessWidget {
  const BotonesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondo(),
          SingleChildScrollView(
            child: Column(
              children: [_titulos(), _crearBotonesRedondeados()],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _fondo() {
    final gradiante = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.5, 0.0),
          end: FractionalOffset(0.5, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ],
        ),
      ),
    );
    final cajarosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360,
        width: 360,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0),
            ]),
            borderRadius: BorderRadius.circular(85.0)),
      ),
    );

    return Stack(
      children: [
        gradiante,
        Positioned(top: -100, child: cajarosa),
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Classify Transaction",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Classify this transaction into a particular category",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                )),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
            caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              size: 30.0,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bubble_chart,
              size: 30.0,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle,
              size: 30.0,
            ),
            title: Container(),
          ),
        ],
      ),
    );
  }

  Widget _crearBotonesRedondeados() {
    return Table(
      children: [
        TableRow(
          children: [
            _botonRedondo(Colors.blue, Icons.border_all, "General"),
            _botonRedondo(Colors.purpleAccent, Icons.directions_bus, "Bus"),
          ],
        ),
        TableRow(
          children: [
            _botonRedondo(Colors.greenAccent, Icons.store, "Groceries"),
            _botonRedondo(Colors.pinkAccent, Icons.storage, "Storage")
          ],
        ),
        TableRow(
          children: [
            _botonRedondo(Colors.amberAccent, Icons.music_note, "Music"),
            _botonRedondo(Colors.deepOrangeAccent, Icons.fastfood, "Buy")
          ],
        ),
        TableRow(
          children: [
            _botonRedondo(Colors.redAccent, Icons.edit, "Edit"),
            _botonRedondo(Colors.cyanAccent, Icons.access_alarms, "alarm")
          ],
        ),
      ],
    );
  }

  Widget _botonRedondo(Color color, IconData icon, String texto) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 180,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 8.0,
              ),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon(
                  icon,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              Text(
                texto,
                style: TextStyle(color: color, fontSize: 20.0),
              ),
              SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
