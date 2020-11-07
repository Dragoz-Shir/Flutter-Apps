import "package:flutter/services.dart" show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opc = [];
  _MenuProvider() {
    //cargarDatos();
  }

  Future<List<dynamic>> cargarDatos() async {
    final resp = await rootBundle.loadString("data/menu_opts.json");
    // .then((data) {
    //   //print(data);
    //   Map dataMap = json.decode(data);
    //   print(dataMap);
    //   print(dataMap["rutas"]);
    // }).catchError((e) => print(e));
    Map dataMap = json.decode(resp);
    opc = dataMap["rutas"];
    return opc;
  }
}

final menuProvider = _MenuProvider();
