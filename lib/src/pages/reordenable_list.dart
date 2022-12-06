import 'dart:math';

import 'package:flutter/material.dart';

class ReordenableList extends StatefulWidget {
  static const route = 'ReordenableList';
  const ReordenableList({super.key});

  @override
  State<ReordenableList> createState() => _ReordenableListState();
}

class _ReordenableListState extends State<ReordenableList> {
  final List mytiles = [
    'antes',
    'dos',
    'tres',
    'cuantro',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drag and Drop Tiles'),
      ),
      body: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {});
          if (newIndex > oldIndex)
            oldIndex--; // esto es necesario porque cuando eliminas de la lista los index se corren se necesita corregirlo
// obtengo el valor el dato enel in index anterior y lo inserto en el nuevo valor
          final oldindexValue = mytiles.removeAt(oldIndex);
          mytiles.insert(newIndex, oldindexValue);
        },
        children: [
          for (final tile in mytiles)
            Padding(
              key: ValueKey(tile),
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                trailing: Icon(Icons.paypal),
                // flutter necesita que los componentes tengan su key para no desorientarse a la hora de idetificar a cada uno.
                tileColor: Color.fromARGB(32, 19, Random().nextInt(150), 175),
                selectedColor:
                    Color.fromARGB(32, 19, Random(0).nextInt(250), 175),

                style: ListTileStyle.list,
                key: ValueKey(tile),
                title: Text(tile),
              ),
            )
        ],
      ),
    );
  }
}
