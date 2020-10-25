import 'package:flutter/material.dart';

class PoorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I Am Poor"),
        centerTitle: true,
      ),
      body: Center(
        child: Image.network(
            "https://thumbs.dreamstime.com/b/burning-coal-icon-outline-burning-coal-vector-icon-web-design-isolated-white-background-burning-coal-icon-outline-style-160127562.jpg"),
      ),
    );
  }
}
