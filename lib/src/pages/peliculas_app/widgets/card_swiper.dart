import 'package:card_swiper/card_swiper.dart';
import 'package:componentes/src/pages/peliculas_app/models/models.dart';
import 'package:componentes/src/pages/peliculas_app/screens/details_screen_film.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
// el card swiper es un pqte
  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //Este widget es el loading, para el caso de que la lista de películas esté vacia
    if (movies.isEmpty) {
      return Container(
        // toma todo el ancho posible
        width: double.infinity,
        height: size.height * 0.5,
        margin: const EdgeInsets.only(top: 10.0),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      margin: const EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.7,
        itemHeight: size.height * 0.9,
        // esta line define la construccion de lo que se mostrara
        itemBuilder: (_, index) {
          // print(movies[index].title);
          final movie = movies[index];
          //movie.heroId = "swiper - ${movie.id}";
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, DetailsScreenFilm.route,
                arguments: movies[index]),
            // Aca se realiza un  pase de parametros a traves de Argments del Metodo Navigator.pushNamed

            /**La creacion de un Hero con un id unico pemite que cuando se realice la transcicion entre el cardWiper y 
             * detailScreen esta sea de forma bonita... solo con definir los Id en ambos pantallas se logra que hero
             *  enlace ambos componentes como el mismo.
             */
            child: Hero(
              tag: movie.id,
              // el ClipRRect me permite darle bordes a lo que muestra el fadeinimage y combinarlo con el fit: BoxFit.cover y se logra los bordes redondeados
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                // con fade realiza una animacion de entrada bonita, se prestapara eso
                child: FadeInImage(
                  placeholder:
                      const AssetImage('assets/peliculasApp/giphy.gif'),
                  // carga imagenes de internet, no necesita pqte
                  //https://via.placeholder.com/300x400  , ruta de imagenes en internet
                  image: NetworkImage(movie.getPosterImg),
                  //height: 550,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
