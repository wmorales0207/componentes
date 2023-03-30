import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
// el card swiper es un pqte
  CardSwiper({required this.movies});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    //Este widget es el loading, para el caso de que la lista de películas esté vacia
    if (movies.isEmpty) {
      return Container(
        // toma todo el ancho posible
        width: double.infinity,
        height: _size.height * 0.5,
        margin: const EdgeInsets.only(top: 10.0),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: _size.height * 0.5,
      margin: const EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: _size.width * 0.7,
        itemHeight: _size.height * 0.9,
        // esta line define la construccion de lo que se motrara
        itemBuilder: (_, index) {
          final movie = movies[index];
          movie.heroId = "swiper - ${movie.id}";
          return Hero(
            tag: movie.heroId!,
            // el ClipRRect me permite darle bordes a lo que muestra el fadeinimage y combinarlo con el fit: BoxFit.cover y se logra los bordes redondeados
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              // con fade realiza una animacion de entrada bonita, se prestapara eso
              child: FadeInImage(
                placeholder: const AssetImage('assets/peliculasApp/giphy.gif'),
                // carga imagenes de internet, no necesita pqte
                //https://via.placeholder.com/300x400  , ruta de imagenes en internet
                image: NetworkImage(movie.getPosterImg),
                height: 550,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        onTap: (index) =>

            Navigator.pushNamed(context, 'details', arguments: movies[index]),
            // Aca se realiza un  pase de parametros a traves de Argments del Metodo Navigator.pushNamed
      ),
    );
  }
}
