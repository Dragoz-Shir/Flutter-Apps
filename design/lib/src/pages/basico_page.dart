import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSub = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _crearImage(),
              _crearTitulo(),
              _creaAcciones(),
              _crearTexto(),
              _crearTexto(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearImage() {
    return Image(
      image: NetworkImage(
          "https://i.pinimg.com/originals/77/d7/86/77d786d36266a58f9da95b2b0c42c8d3.jpg"),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Orgrimmar",
                    style: estiloTitulo,
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    "Ubicada en el extremo norte de Durotar",
                    style: estiloSub,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Text("4.1")
          ],
        ),
      ),
    );
  }

  Widget _creaAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _crearIconoConNmbre(Icons.call, "Call"),
        _crearIconoConNmbre(Icons.near_me, "Route"),
        _crearIconoConNmbre(Icons.share, "Share"),
      ],
    );
  }

  Widget _crearIconoConNmbre(IconData icono, String texto) {
    return Column(
      children: [
        Icon(
          icono,
          color: Colors.blue,
          size: 30.0,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          texto,
          style: TextStyle(color: Colors.blue, fontSize: 15.0),
        ),
      ],
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
        child: Text(
          "Thrall guió a los orcos al continente de Kalimdor, donde fundaron su nuevo hogar y lo bautizaron Durotar, en honor al padre asesinado de Thrall. Los orcos construyeron una sociedad basada en la sobrevivencia y la prosperidad, en lugar de la conquista, y dejaron atrás su pasado sangriento y su maldición demoníaca. Orgrimmar, cuyo nombre es un homenaje al antiguo Jefe de Guerra, Orgrim Martillo Maldito, se construyó en poco tiempo, con la ayuda de goblins, taurens, trols y Rexxar. Actualmente, Orgrimmar se ubica al pie de una montaña entre Durotar y Azshara. Sin embargo, los tiempos han cambiado. Desde que Garrosh asumió como Jefe de Guerra, ha marginado a muchas razas debido a su naturaleza agresiva e insegura. Luego del Cataclismo, Orgrimmar se ha expandido y reforzado con puntas protectoras de metal.",
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
