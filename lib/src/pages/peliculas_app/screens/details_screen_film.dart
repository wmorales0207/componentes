import 'package:componentes/src/pages/peliculas_app/models/movie.dart';
import 'package:componentes/src/pages/peliculas_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailsScreenFilm extends StatelessWidget {
  static const route = "details";
  @override
  Widget build(BuildContext context) {
    //de esta forma se recogen los datos que fueron pasados como argumentos a DetailsScreen desde Navigator.pushNamed en MovieSlider
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      // los CustomScrollView son del tipo SingleChildScrollView pero estos tienen la diferencia de que
      // Trabaja con SLIVERS (Son widgets que tienen cierto comportamiento preprogramado cuando se hace scroll
      // en el contenido del padre)
      // Incluso el CustomScrollView esta en el Body lo que te permite, crear todos los elementos por debajo a partir de Slivers , empezando por el APPbar
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie),
          // Para Seguir contruyendo lo demas de la UI es necesario usar SliverList ya que permite
          // a;adir una lista de widget y ahi se pueden a;adir los comunes(Colums, text, row etc).
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie),
              _OverView(movie.overview),
              _OverView(movie.overview),
              CastingSlider(idmovie: movie.id),
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar(this.movie);
  @override
  Widget build(BuildContext context) {
    // existen muchos slivers y cada uno con su funcionalidad especifica, este Appbar es como los demas
    // solo que se puede controlar el alto y ancho del mismo
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 300.0,
      floating: false,
      // no llega a desaparecer del todo
      pinned: true,
      // este FlexibleSpaceBar tine un comportamiento bien adecuado para hacer scroll.
      flexibleSpace: FlexibleSpaceBar(
        // el title no tienen que se r un texto necesariamnte, es un widget y con eso se puede poner cualquier cosa
        title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 10),
            color: Colors.black12,
            child: Text(
              movie.getTitle,
              style: const TextStyle(fontSize: 16),
            )),
        // cuando le pones el container y cambias el color , por debajo queda un remnente del color de fondo del texto
        //anterior y con  titlePadding: const EdgeInsets.all(0) se elimina
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        background: FadeInImage(
          placeholder: const AssetImage('assets/peliculasApp/giphy.gif'),
          image: NetworkImage(movie.getBackDropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle(this.movie);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      width: 110,
      height: 190,
      child: Row(children: [
        Hero(
          tag: movie.heroId!,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FadeInImage(
              placeholder: const AssetImage('assets/peliculasApp/300x400.png'),
              image: NetworkImage(movie.getPosterImg),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 180,
          margin: const EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                movie.getTitle,
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              Text(
                movie.originalTitle,
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outline,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '${movie.voteAverage}',
                    style: textTheme.caption,
                  )
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class _OverView extends StatelessWidget {
  final String overview;

  const _OverView(this.overview);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        overview,
        style: Theme.of(context).textTheme.subtitle2,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
