import 'dart:async';

import 'package:componentes/src/pages/peliculas_app/helpers/debouncer.dart';
import 'package:componentes/src/pages/peliculas_app/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

// la clase provider esta dise;ada para proveer informacion y la extends ChangeNotifier es obligatoria para ser usado como provider
class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'f32ccd05c2611150e4ed3ffe3e2c5093';
  final String _baseUrl = 'api.themoviedb.org';
  final String _lenguage = 'es-ES';

  // esta var esta para poder incrementar la page y poder implementar el infinite scroll
  int _page = 0;

  List<Movie> onNowMovies = [];
  List<Movie> onPopular = [];
  // esta ojetoo tiene el d de la pelicula y el listado de los actores.
  // en este caso se trata de cargar los actores solo si no estan en memoria o si no han sdo cargados.
  Map<int, List<Cast>> movieCasts = {};
  List<Movie> onFound = [];

  final StreamController<List<Movie>> _suggestionStreamController =
      StreamController.broadcast();

  Stream<List<Movie>> get suggestionStream {
    return _suggestionStreamController.stream;
  }

  final mydebouncer =
      Debouncer<String>(duration: const Duration(milliseconds: 500));

  final StreamController<List<Movie>> _suggestionsStreamController =
      StreamController.broadcast();

  Stream<List<Movie>> get suggestionStreams =>
      _suggestionStreamController.stream;

  MoviesProvider() {
    //getOnDisplayMovies(); // testing
    getNowPlayingMovies();
    getPopular();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      "api_key": _apiKey,
      "lenguage": _lenguage,
      "page": 1,
    });

    final response = await http.get(url);

    //final decodeData = jsonDecode(response.body) as Map<String, dynamic>;
    final NowPlaying nowPlayingResponse = NowPlaying.fromJson(response.body);

    if (response.statusCode != 200) print("Error");
// se puede trabajar como un mapa.
    print(nowPlayingResponse.results[0].title);
  }

// aca este parametro de page is opcional y sino se pasa por defecto sera 1.
  Future<String> _getJsonData(String segment, [int page = 1]) async {
    final url = Uri.https(_baseUrl, segment,
        {'api_key': _apiKey, 'lenguage': _lenguage, 'page': '$page'});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(" Aqui las filmes ${response.body}");
      return response.body;
    }

    return '';
  }

  getNowPlayingMovies() async {
    final nowMoviesJson = await _getJsonData('/3/movie/now_playing');
    onNowMovies = NowPlaying.fromJson(nowMoviesJson).results;
    notifyListeners();
  }

  getPopular() async {
    _page++; //Esto es para que me recorra las paginas
    final popularJson = await _getJsonData('/3/movie/popular', _page);
    final popularResponse = Popular.fromJson(popularJson);
    if (_page == 1) {
      onPopular = popularResponse.results;
    } else {
      //aca se muestra una forma de concatenar ambos resultados, ambas listas
      onPopular = [...onPopular, ...popularResponse.results];
    }
    notifyListeners();
  }

// este metodo dvuelve un future,
  Future<List<Cast>> getMovieCasts({required int idmovie}) async {
    //Si contiene la lista de actores de la pelicula la retorno
    if (movieCasts.containsKey(idmovie)) return movieCasts[idmovie]!;
    //Si no contiene la lista de actores de la pelicula hago un petición
    //http y la guardo en memoria
    final jsonData = await _getJsonData('/3/movie/$idmovie/credits');
    final movieCredits = MovieCredits.fromJson(jsonData);
    movieCasts[idmovie] = movieCredits.cast;
    return movieCredits.cast;
  }

  void getSuggestionByQuery(String searchterm) {
    
  }

  //Función qeu asigna el query al stream
  //
  void setSuggestionsByQuery(String query) {
    mydebouncer.value = '';
    mydebouncer.onValue = (value) async {
      final result = await getMoviesSearch(movietitle: query);
      _suggestionStreamController.add(result);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      mydebouncer.value = query;
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }

  Future<List<Movie>> getMoviesSearch({required String movietitle}) async {
    final url = Uri.https(_baseUrl, '/3/search/movie',
        {'api_key': _apiKey, 'lenguage': _lenguage, 'query': movietitle});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return MoviesFound.fromJson(response.body).results;
    }
    return [];
  }
}
