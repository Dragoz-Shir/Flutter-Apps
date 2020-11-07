import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Card Page"),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: [
            _cardTipo1(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo2(),
          ],
        ));
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text("Titulo card 1"),
            subtitle: Text(
                "pss dijo que algo que sea grade para que aparazca chido en el pinche subtitulo y no se me ocurre otra cosa asi que yolo"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: () {},
                child: Icon(
                  Icons.accessibility_new,
                  color: Colors.green,
                ),
              ),
              FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.accessibility,
                    color: Colors.red,
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage("https://i.redd.it/pi0538gmn2651.png"),
            placeholder: AssetImage("assets/jar-loading.gif"),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("No se donde es"),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10.0, spreadRadius: 0.0),
        ],
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
