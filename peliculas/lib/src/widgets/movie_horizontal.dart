import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function funcionCargar;
  MovieHorizontal({@required this.peliculas, @required this.funcionCargar});
  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        //print("cargar siguientes");
        funcionCargar();
      }
    });

    return Container(
      height: _screenSize.height * 0.25,
      child: PageView.builder(
        controller: _pageController,
        //children: _tarjetas(context),
        pageSnapping: false,
        itemCount: peliculas.length,
        itemBuilder: (context, index) => _tarjeta(context, peliculas[index]),
      ),
    );
  }

  Widget _tarjeta(BuildContext context, Pelicula peli) {
    peli.peliculaDondeID = peli.id.toString() + "tarjeta";

    final tarjeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          Hero(
            tag: peli.peliculaDondeID,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage("assets/img/no-image.jpg"),
                image: NetworkImage(peli.getPosterImg()),
                fit: BoxFit.cover,
                height: 160,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            peli.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );

    return GestureDetector(
      child: tarjeta,
      onTap: () {
        Navigator.pushNamed(context, "detalle", arguments: peli);
      },
    );
  }

  List<Widget> _tarjetas(BuildContext context) {
    return peliculas.map((peli) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage("assets/img/no-image.jpg"),
                image: NetworkImage(peli.getPosterImg()),
                fit: BoxFit.cover,
                height: 160,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              peli.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );
    }).toList();
  }
}
