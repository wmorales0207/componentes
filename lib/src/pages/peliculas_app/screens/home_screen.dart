import 'package:componentes/src/pages/peliculas_app/providers/movie_provider.dart';
import 'package:componentes/src/pages/peliculas_app/search/search_delegate.dart';
import 'package:componentes/src/pages/peliculas_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const route = "Peliculas";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    //se crea una instancia del provider de peliculas ya que se va a usar en esta UI
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en Cines'),
        elevation: 0.0,
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            // el showSearch es un metodo global que ya existe, el deleate es algo que hay que crear.
            // Un delegate es un widget o clase que cumple ciertas condiciones
            onPressed: () =>
                showSearch(context: context, delegate: MovieSearchDelegate()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          //Películas en Cines
          CardSwiper(movies: moviesProvider.onNowMovies),

          //Películas populares
          Container(
            margin: const EdgeInsets.only(top: 15.0),
            child: MovieSlider(
              movies: moviesProvider.onPopular,
              // aca se pasa como parametro una funcion, y esta funcion es la que obtiene la informacion
              onNexPage: () => moviesProvider.getPopular(),
            ),
          ),
        ]),
      ),
    );
  }
}
