import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  final peliculaprovider = PeliculaProvider();

  String seleccion = "";
  final listaTodas = [
    "Spider-man",
    "Spider-man 2",
    "Spider-man 3",
    "Bat-man ",
    "Aquaman",
    "Bat-man 2",
    "Justice League",
    "Wonder Woman",
    "Wonder Woman 84"
  ];
  final listaReciente = ["Wonder Woamn 84", "Soul"];

  @override
  List<Widget> buildActions(BuildContext context) {
    //Las acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Instruccion que crear los resultados que vamos a mostrar
    return Center(
      child: Container(
        child: Center(
          child: Text(seleccion),
        ),
        color: Colors.amberAccent,
        height: 150,
        width: 150,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando se escribe

    if (query.isEmpty) {
      return Container();
    } else {
      return FutureBuilder(
        future: peliculaprovider.searchMovie(query),
        builder:
            (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
          if (snapshot.hasData) {
            final peliculas = snapshot.data;
            return ListView(
              children: peliculas.map((peli) {
                return ListTile(
                  leading: FadeInImage(
                    image: NetworkImage(peli.getPosterImg()),
                    placeholder: AssetImage("assets/img/no-image.jpg"),
                  ),
                  title: Text(peli.title),
                  subtitle: Text(peli.originalTitle.toString()),
                  onTap: () {
                    peli.peliculaDondeID = "";
                    close(context, null);
                    Navigator.pushNamed(context, "detalle", arguments: peli);
                  },
                );
              }).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }

    // final listaSugerida = (query.isEmpty)
    //     ? listaReciente
    //     : listaTodas
    //         .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
    //         .toList();

    // return ListView.builder(
    //   itemCount: listaSugerida.length,
    //   itemBuilder: (context, i) {
    //     return ListTile(
    //       leading: Icon(Icons.movie_filter),
    //       title: Text(listaSugerida[i]),
    //       onTap: () {
    //         seleccion = listaSugerida[i];
    //         showResults(context);
    //       },
    //     );
    //   },
    // );
  }
}
