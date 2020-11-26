import 'package:flutter/material.dart';

import 'package:peliculas/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peliculas"),
        centerTitle: false,
      ),
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            _crearSwiper(),
          ],
        ),
      )),
    );
  }

  Widget _crearSwiper() {
    return CardSwiper(
      peliculas:[1,2,3,4,5,6]
    );
  }
}
