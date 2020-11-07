import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => _crearAlert(context),
          color: Colors.blue,
          child: Text("Mostrar"),
          textColor: Colors.white,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context)),
    );
  }

  void _crearAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text("Titulo del Alert"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Contenido dentro de un colum con mainAxisSize al min"),
              FlutterLogo(
                colors: Colors.amber,
                size: 100.0,
              ),
            ],
          ),
          actions: [
            FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Cancelar")),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK")),
          ],
        );
      },
    );
  }
}
