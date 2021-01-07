import 'package:flutter/material.dart';

import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';
import 'package:peliculas/src/search/search_delegate.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = new PeliculaProvider();
  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        title: Text("Peliculas"),
        centerTitle: false,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              }),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _crearSwiper(),
            _footer(context),
          ],
        ),
      ),
    );
  }

  Widget _crearSwiper() {
    // final peliculas = peliculasProvider.getCines();
    // return CardSwiper(peliculas: [1, 2]);
    return FutureBuilder(
      future: peliculasProvider.getCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data);
        } else {
          return Container(
            //height: 400.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    // final peliculas = peliculasProvider.getPopulares();

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Populares",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            padding: EdgeInsets.only(left: 20.0),
          ),
          SizedBox(
            height: 5.0,
          ),
          StreamBuilder(
            //future: peliculasProvider.getPopulares(),
            stream: peliculasProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                //print(snapshot.data);
                return MovieHorizontal(
                  peliculas: snapshot.data,
                  funcionCargar: peliculasProvider.getPopulares,
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
