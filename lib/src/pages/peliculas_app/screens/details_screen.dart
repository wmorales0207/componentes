import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
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
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie),
              _OverView(movie.overview),
              _OverView(movie.overview),
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
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          title: Container(
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 10),
              color: Colors.black12,
              child: Text(
                movie.getTitle,
                style: const TextStyle(fontSize: 16),
              )),
          titlePadding: const EdgeInsets.all(0),
          centerTitle: true,
          background: FadeInImage(
            placeholder: const AssetImage('assets/giphy.gif'),
            image: NetworkImage(movie.getBackDropPath),
            fit: BoxFit.cover,
          )),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle(this.movie);
  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      width: 130,
      height: 190,
      child: Row(children: [
        Hero(
          tag: movie.heroId!,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/300x400.png'),
              image: NetworkImage(movie.getPosterImg),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 230,
          margin: EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                movie.getTitle,
                style: _textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                movie.originalTitle,
                style: _textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_outline,
                    size: 15,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '${movie.voteAverage}',
                    style: _textTheme.caption,
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
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        overview,
        style: Theme.of(context).textTheme.subtitle2,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
