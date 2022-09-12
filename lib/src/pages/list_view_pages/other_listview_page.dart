import 'package:componentes/src/pages/list_view_pages/my_circle.dart';
import 'package:componentes/src/pages/list_view_pages/square.dart';
import 'package:flutter/material.dart';

class OtherListPage extends StatelessWidget {
  const OtherListPage({super.key});

  @override
  Widget build(BuildContext context) {
    //physics: const NeverScrollableScrollPhysics(), esta propiedad define que el user no pueda hacer Scroll
    // el Listview por defecto hace scroll s un de sus ventajas,
    List<String> items = [
      'post 1',
      'post 2',
      'post 3',
      'post 4',
    ];

    List<String> _stories = [
      'Story  1',
      'Story 2',
      'Story 3',
      'Story 4',
    ];
    return Column(
      children: [
// Instagram Stories  semueve horizontalmente

        SizedBox(
          height: 150,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return MyCircle(
                stories: _stories[index],
              );
            },
            itemCount: 4,
            scrollDirection: Axis.horizontal,
          ),
        ),

//Instagrams Post

        Expanded(
          // aca no se uso un container porque se necesita que ocupe todo el espacio hacia abajo el listview.
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: ((context, index) {
              return MySquare(
                contenido: items[index],
              ); // el elemento se redibuja por cada uno de los elementos que contenga la lista
            }),
          ),
        ),
      ],
    );
  }
}
