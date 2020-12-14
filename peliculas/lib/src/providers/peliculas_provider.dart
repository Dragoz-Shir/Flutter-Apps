import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculaProvider {
  String _apikey = "tuAPI";
  String _url = "api.themoviedb.org";
  String _language = "es-ES";
  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _listPopulares = new List();
  final _popularesStreamController =
      new StreamController<List<Pelicula>>.broadcast();

  ///se usa  "<List<Pelicula>>" para que nos ayude el id para solo recibir una lista de peliculas

  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
    //aca se usa el signo de "?" para ver si tiene algun valor
  }

  Future<List<Pelicula>> _procesarInfo(Uri url) async {
    final respuesta = await http.get(url);
    final decodedData = json.decode(respuesta.body);

    final peliculas = new Peliculas.fromJsonList(decodedData["results"]);

    return peliculas.items;
  }

  Future<List<Pelicula>> getCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});

    return await _procesarInfo(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    if (_cargando) return [];

    _cargando = true;

    _popularesPage++;
    //print("cargando siguientes");
    final url = Uri.https(
      _url,
      "3/movie/popular",
      {
        "api_key": _apikey,
        "language": _language,
        "page": _popularesPage.toString()
      },
    );
    // final respuesta = await http.get(url);
    // final decoded = json.decode(respuesta.body);
    // //print(decoded["results"]);
    // final peliculas = Peliculas.fromJsonList(decoded["results"]);
    // return peliculas.items;

    final resp = await _procesarInfo(url);

    _listPopulares.addAll(resp);
    popularesSink(_listPopulares);
    _cargando = false;
    return resp;
  }
}
