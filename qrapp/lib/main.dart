import 'package:flutter/material.dart';
import 'package:qrapp/pages/home_page.dart';
import 'package:qrapp/pages/map_page.dart';
import 'package:provider/provider.dart';
import 'package:qrapp/providers/ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new UiProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.deepOrange,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange,
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'QR App',
        initialRoute: "home",
        routes: {
          "home": (_) => HomePage(),
          "map": (_) => MapPage(),
        },
      ),
    );
  }
}
