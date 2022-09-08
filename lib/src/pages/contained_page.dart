import 'dart:math';

//import 'package:componentes/src/pages/absob_Pointer.dart';
import 'package:flutter/material.dart';

class ContainedPage extends StatefulWidget {
  const ContainedPage({super.key});

  @override
  State<ContainedPage> createState() => _ContainedPageState();
}

class _ContainedPageState extends State<ContainedPage> {
  Color _colorAsigned = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Container17'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment
            .spaceEvenly, // comportamiento del espacio entre childrens
        children: [
          Container(
            height: 200.0,
            width: 200.0,
            
            //color: Colors.grey[300],

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey[300],
              boxShadow: [
                BoxShadow(
                    color: _colorAsigned, // aca se define el color de la sombra
                    offset: Offset(4.0, 4.0), //la ubicacion de la sombra
                    blurRadius:
                        15.0, // esta realcionado tambien con la expansion de la sombra
                    spreadRadius: 1.0), // que tanto se quiere que se expanda
                BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
              ],
              // shape: BoxShape.circle,
            ),
            child: const Text(
              'Testing',
              //textAlign: TextAlign.right,
              style: TextStyle(fontSize: 30.0),
            ), // con el textAlign: TextAlign.right, de text tambien se puede definir posicion dentro de un contained
          ),
          FloatingActionButton(
            onPressed: _changeAgain,
            child: const Icon(Icons.play_arrow),
          ),
          Container(
            width: double.infinity,
            height: 30,
            color: _colorAsigned,
          ),
        ],
      ),
    );
  }

  Color _changeAgain() {
    var red = Color.fromRGBO(Random().nextInt(200) + 50,
        Random().nextInt(200) + 50, Random().nextInt(200) + 50, 1);
    setState(() {
      _colorAsigned = red;
    });

    print('variable asignada $_colorAsigned');

    print('valor entero $red');

    return red;
  }
}
