import 'package:componentes/src/pages/peliculas_app/models/models.dart';
import 'package:componentes/src/pages/peliculas_app/providers/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// esta clase debe mplementar la clase SearchDelegate para poder usarse en el metodo showSearch
// por defecto trae varios metodos que son los que que se sobreescriben y algunas otros comportamientos
// que se pueden modificar.
class MovieSearchDelegate extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => "Buscar Pelicula";

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: () => query = "", icon: Icon(FontAwesomeIcons.x)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        // this method close() comes from el delegate
        // el segundo parametro es el el resultado que se desea enviar al idget que genero la llamada, pero como no se desea enviar nada , pues es null
        close(context, null);
      },
      icon: const Icon(FontAwesomeIcons.arrowLeft),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return const Text("buildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    // query  comes from the dart, its a basic object
    //return Text("buildSuggestions $query");
    if (query.isEmpty) {
      return const _EmptyContainer();
    }
/**
 * Ahora viene la parte mas interesante.
 * Las solicitudes http se pueden hacer por cada teclaque se apriete o cuando se de Enter a 
 * la palabra que se desee, una forma de hacerlo es con los devounce y cn una funcionalidad del backend
 * que tenga que ver con esto claro.
 */
    //print("peticion http de provder");
    final movieProvider = Provider.of<MoviesProvider>(context, listen: false);

    movieProvider.getSuggestionByQuery(query);

    // return FutureBuilder(
    //   future: movieProvider.getMoviesSearch(movietitle: query),
    //   builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
    //     if (!snapshot.hasData) {
    //       return const _EmptyContainer();
    //     }
    //     final movies = snapshot.data!;
    //     return ListView.builder(
    //       itemCount: movies.length,
    //       itemBuilder: (_, index) {
    //         return _SugestionMovieItems(movies[index]);
    //       },
    //     );
    //   },
    // );
    return StreamBuilder(
      stream: movieProvider.suggestionStream,
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) {
          return const _EmptyContainer();
        }
        final movies = snapshot.data!;
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (_, index) {
            return _SugestionMovieItems(movies[index]);
          },
        );
      },
    );
  }
}

class _EmptyContainer extends StatelessWidget {
  const _EmptyContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Center(
        child: Icon(
          Icons.movie_creation_outlined,
          color: Colors.black,
          size: 100,
        ),
      ),
    );
  }
}

class _SugestionMovieItems extends StatelessWidget {
  final Movie movie;
  // aca no se necesita on contrunctor con key u otro elemento ya que no se seleccionara en las busquedas
  const _SugestionMovieItems(this.movie);

  @override
  Widget build(BuildContext context) {
    // el ListTile es adecuado para devolver dentro del Listview.builder
    return ListTile(
      leading: SizedBox.shrink(
        child: FadeInImage(
          image: NetworkImage(movie.getPosterImg),
          placeholder: const AssetImage("assets/peliculaApp/300x400.png"),
          width: 40.0,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () {
        // cargar la pag de los detaalles  a partir de la busqueda
        Navigator.pushNamed(context, "details", arguments: movie);
      },
    );
  }
}
