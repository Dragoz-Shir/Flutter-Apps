import 'package:flutter/material.dart';

import 'dart:async';

class ListviewPage extends StatefulWidget {
  ListviewPage({Key key}) : super(key: key);

  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  List<int> _lista = new List();
  int _ultimoItem = 0;
  ScrollController _scrollController = new ScrollController();
  bool _estaCargando = false;

  @override
  void initState() {
    _agregar5();
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //print("llegue al final, tiempo de recargar");
        //_agregar5();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            _crearListView(),
            _crearLoading(),
          ],
        ));
  }

  Widget _crearListView() {
    return RefreshIndicator(
      onRefresh: _paraRefrescar,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _lista.length,
          itemBuilder: (BuildContext context, int i) {
            int imagen = _lista[i];

            return FadeInImage(
                placeholder: AssetImage("assets/jar-loading.gif"),
                image: NetworkImage(
                    "https://picsum.photos/500/300/?image=$imagen"));
          }),
    );
  }

  Future<Null> _paraRefrescar() {
    new Timer(Duration(seconds: 2), () {
      _lista.clear();
      _ultimoItem++;
      _agregar5();
    });
    //new Timer(Duration(seconds: 2), _agregar5);
    return Future.delayed(Duration(seconds: 2));
  }

  void _agregar5() {
    for (int i = 0; i < 5; i++) {
      _ultimoItem++;
      _lista.add(_ultimoItem);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _estaCargando = true;
    setState(() {});
    return new Timer(new Duration(seconds: 2), _peticionHTTP);
  }

  void _peticionHTTP() {
    _estaCargando = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);

    _agregar5();
  }

  Widget _crearLoading() {
    if (_estaCargando) {
      return Column(
        children: [
          Row(
            children: [
              CircularProgressIndicator(
                backgroundColor: Colors.red,
                strokeWidth: 20.0,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(
            height: 15,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      );
    } else {
      return Container();
    }
  }
}
