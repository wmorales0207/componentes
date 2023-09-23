import 'package:componentes/src/pages/peliculas_app/models/models.dart';
import 'package:componentes/src/pages/peliculas_app/screens/details_screen_film.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  // el widget recibira una funcion como parametros, funcion que sera llamada cuando se cumpla el requisito del scroll
  final Function onNexPage;
  const MovieSlider({super.key, required this.movies, required this.onNexPage});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  // con el ScrollController logro controllar cuando ha llegado al final y asi poder hacer acciones en funcion del scroll., tambien de
  //debe ser un statefullwidget para poder redibujar mas facil
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      // se le resta 500 a la posicion de los pixels para que cuando este cercano al final haga la llmada de metodo onNexPage
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) widget.onNexPage();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.38,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Si no hay titulo este widget no se muestra
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text('Populares',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          // el listview define su heigth por su padre, por lo que un expended le dice , que ocupe todo el espacio disponible
          child: ListView.builder(
            // ACA SE asocia el controller al Listview ya que en este caso es le que muestra la info que se desea scrollear
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.movies.length,
            itemBuilder: (_, index) =>
                _MoviePoster(movie: widget.movies[index]),
          ),
        )
      ]),
    );
  }
}

// _ define que es una clase privada, qie solo exisira en este archivo
class _MoviePoster extends StatelessWidget {
  final Movie movie;
  
  const _MoviePoster({required this.movie});

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'slider-${movie.id}';
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      width: 110,
      height: 190,
      child: Column(children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, DetailsScreenFilm.route,
              arguments: movie),
          child: Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage(
                placeholder: const AssetImage('assets/peliculasApp/giphy.gif'),
                image: NetworkImage(
                  movie.getPosterImg,
                ),
                //fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        Text(
          movie.getTitle,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
