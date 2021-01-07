import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;
  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Swiper(
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          peliculas[index].peliculaDondeID =
              peliculas[index].id.toString() + "card_swiper";
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "detalle",
                  arguments: peliculas[index]);
            },
            child: Hero(
              tag: peliculas[index].peliculaDondeID,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                    placeholder: AssetImage("assets/img/loading.gif"),
                    image: NetworkImage(peliculas[index].getPosterImg()),
                    fit: BoxFit.cover,
                  )
                  // child: Text(
                  //   peliculas[index].toString(),
                  //   style: TextStyle(fontSize: 40),
                  // ),
                  ),
            ),
          );
        },
        itemCount: peliculas.length,
        layout: SwiperLayout.STACK,
        // pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );
  }
}
