import 'package:componentes/src/pages/peliculas_app/models/models.dart';
import 'package:componentes/src/pages/peliculas_app/providers/movie_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CastingSlider extends StatelessWidget {
  final int idmovie;
  
  const CastingSlider({super.key, required this.idmovie});
  @override
  Widget build(BuildContext context) {
    final movieProvider=Provider.of<MoviesProvider>(context,listen: false);
    return FutureBuilder(
      future:movieProvider.getMovieCasts(idmovie: idmovie),
      builder: (_,AsyncSnapshot<List<Cast>> snapshot)
      {
        if(!snapshot.hasData)
        {
          return const SizedBox(
                  child:CupertinoActivityIndicator(),
          );
        }
        
        final lstcast=snapshot.data!;
        return Container(
                width: double.infinity,
                height: 205,      
                margin: const EdgeInsets.only(bottom: 30),
                child: Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:lstcast.length,
                      itemBuilder: (_, index)=>_CastCard(actor:lstcast[index]),                  
                    ),
                ), 
             );      
          }
      );    
  }
}

class _CastCard extends StatelessWidget{
  final Cast actor;

  const _CastCard({required this.actor});
  @override
  Widget build(BuildContext context) {   
    return Container(
           width: 120,
           height: 200,
           margin: const EdgeInsets.only(left: 10),           
           child:Column(
             children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/peliculasApp/300x400.png'),
                    image: NetworkImage(actor.getProfilePath),
                    height: 150,
                    fit: BoxFit.cover,
                    ),
                ),                
                Text(actor.name, maxLines: 2, overflow: TextOverflow.ellipsis,)
            ]),
    );
  }
}

