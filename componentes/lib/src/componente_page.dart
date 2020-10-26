import 'package:flutter/material.dart';

class ComponentePage extends StatelessWidget {
  final List<String> opciones = [
    "Holi",
    "esta",
    "wea",
    "es",
    "una",
    "lista",
    "renderizada",
    "por",
    "el",
    "metodo",
    "map"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
        centerTitle: true,
      ),
      body: ListView(
        children: _crearTiles(),
      ),
    );
  }

  List<Widget> _crearTiles() {
    return opciones.map((opcion) {
      return Column(
        children: [
          ListTile(
            title: Text(opcion),
            leading: Icon(Icons.adb),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(
            thickness: 2.0,
            color: Colors.amber,
          )
        ],
      );
    }).toList();
  }
}
