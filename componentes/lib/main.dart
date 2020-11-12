import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/pages/alert_page.dart';

//import 'package:componentes/src/pages/componente_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print(".............................");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', 'ES'), // Hebrew, no country code

        // ... other locales the app supports
      ],
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
