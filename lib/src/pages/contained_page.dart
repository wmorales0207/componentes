import 'package:flutter/material.dart';

class ContainedPage extends StatelessWidget {
  const ContainedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Container17'),
      ),
      body: Center(
        child: Container(
          height: 250.0,
          width: 250.0,
          //color: Colors.grey[300],

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            // color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                  color: Colors
                      .grey.shade500, // aca se define el color de la sombra
                  offset: Offset(4.0, 4.0), //la ubicacion de la sombra
                  blurRadius: 15.0, // esta realcionado tambien con la expansion de la sombra
                  spreadRadius: 1.0), // que tanto se quiere que se expanda
              BoxShadow(
                  color: Colors.white,
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
      ),
    );
  }
}
