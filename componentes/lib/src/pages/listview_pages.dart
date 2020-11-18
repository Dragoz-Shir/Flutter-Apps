import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  ListviewPage({Key key}) : super(key: key);

  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  List<int> _lista = new List();
  int _ultimoItem = 0;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    _agregar5();
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //print("llegue al final, tiempo de recargar");
        _agregar5();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        centerTitle: true,
      ),
      body: _crearListView(),
    );
  }

  Widget _crearListView() {
    return ListView.builder(
        controller: _scrollController,
        itemCount: _lista.length,
        itemBuilder: (BuildContext context, int i) {
          int imagen = _lista[i];

          return FadeInImage(
              placeholder: AssetImage("assets/jar-loading.gif"),
              image:
                  NetworkImage("https://picsum.photos/500/300/?image=$imagen"));
        });
  }

  void _agregar5() {
    for (int i = 0; i < 5; i++) {
      _ultimoItem++;
      _lista.add(_ultimoItem);
    }
    setState(() {});
  }
}
