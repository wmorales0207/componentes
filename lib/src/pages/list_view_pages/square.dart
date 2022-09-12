import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  const MySquare({super.key, required this.contenido});

  final String contenido;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 400,
        color: Colors.deepPurple[200],
        child: Center(
          child: Text(
            contenido,
            //style: TextStyle(backgroundColor: Colors.black45),
          ),
        ),
      ),
    );
  }
}
