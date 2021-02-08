import 'package:flutter/material.dart';
import 'package:qrapp/widgets/custom_navigatorBar.dart';
import 'package:qrapp/widgets/custom_fab.dart';
import 'package:qrapp/pages/map_page.dart';
import 'package:qrapp/pages/direcciones_page.dart';
import 'package:provider/provider.dart';

import 'package:qrapp/providers/db_provider.dart';
import 'package:qrapp/providers/ui.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Historial"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {},
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: CustomFloatingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //obtener la opcion seleccionadad desde provider
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectMenuOpt;

    //TODO: temporal leer la bd
    // final tempScan = ScanModel(valor: "https://www.google.com");
    //  DBProvider.db.nuevoScan(tempScan);
    // DBProvider.db.getScanByID(7);
    DBProvider.db.getTodosScans().then(print);

    switch (currentIndex) {
      case 0:
        return MapPage();
        break;
      case 1:
        return DireccionesPage();
        break;
      default:
        return MapPage();
    }
  }
}
