import 'package:componentes/src/pages/alert_page.dart';

import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';

//import 'package:componentes/src/pages/componente_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print(".............................");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: HomePage(),
      initialRoute: "/",
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return AlertPage();
          },
        );
      },
    );
  }
}
