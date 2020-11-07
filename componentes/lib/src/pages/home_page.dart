import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_screen_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
        centerTitle: true,
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    //print(menuProvider.opc);
    // menuProvider.cargarDatos().then((loqueRegreso) => print(loqueRegreso));

    // ListView(children: _crearItems())
    return FutureBuilder(
      future: menuProvider.cargarDatos(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        //print(snapshot);
        return ListView(children: _crearItems(snapshot.data, context));
      },
    );
  }

  List<Widget> _crearItems(List<dynamic> dataR, context) {
    // final List<Widget> opc = [];

    // dataR.forEach((element) {
    //   final widgetTemp = ListTile(
    //     title: Text(element["texto"]),
    //     trailing: Icon(Icons.arrow_forward_ios),
    //     onTap: () {
    //       Navigator.pushNamed(context, element["ruta"]);
    //     },
    //   );

    //   opc..add(widgetTemp)..add(Divider());
    // });
    // return opc;
    return dataR.map((elemento) {
      return Column(
        children: [
          ListTile(
            title: Text(elemento["texto"]),
            leading: getIcon(elemento["icon"]),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.blueGrey,
            ),
            onTap: () {
              // final route = MaterialPageRoute(
              //   builder: (context) => AlertPage(),
              // );
              // Navigator.push(context, route);
              Navigator.pushNamed(context, elemento["ruta"]);
            },
          ),
          Divider(
            color: Colors.blueGrey,
          )
        ],
      );
    }).toList();
  }
}
