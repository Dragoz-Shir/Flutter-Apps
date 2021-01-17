import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  final estiloTexto = TextStyle(color: Colors.white, fontSize: 50.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          _crearPagina1(),
          _crearPagina2(),
        ],
      ),
    );
  }

  Widget _crearPagina1() {
    return Stack(
      children: [_colorFondo(), _imagenFondo(), _crearTexto()],
    );
  }

  Widget _colorFondo() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromRGBO(80, 194, 221, 1),
    );
  }

  Widget _imagenFondo() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Image(
        image: AssetImage("assets/scroll-1.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Text(
            "11°",
            style: estiloTexto,
          ),
          Text(
            "Miercoles",
            style: estiloTexto,
          ),
          Expanded(
            child: Container(),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: 80.0,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _crearPagina2() {
    return Stack(
      children: [
        _colorFondo(),
        Center(
          child: RaisedButton(
            shape: StadiumBorder(),
            color: Colors.blue,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
              child: Text(
                "Bienvenidos",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
