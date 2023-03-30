import 'package:componentes/src/pages/peliculas_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const route = "HomeScreen";
  @override
  Widget build(BuildContext context) {
    //se crea una instancia del provider de peliculas
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en Cines'),
        elevation: 0.0,
        centerTitle: false,
        actions: [
          const IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () =>
                  showSearch(context: context, delegate: SearchMovie())),
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
              onNexPage: () => moviesProvider.getPopular(),
            ),
          ),
        ]),
      ),
    );
  }
}
