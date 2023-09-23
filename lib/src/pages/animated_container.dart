import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _height = 50.0;
  double _width = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Contained'),
      ),
      body: Center(
        child: AnimatedContainer(
          // la conversion a AnimatedContainer trae efctos de animacion muy buenos la opcion duration define la duracion de la transicion
          height: _height,
          width: _width,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
          duration: const Duration(milliseconds: 200),
          curve: Curves
              .fastOutSlowIn, // este objeto es valido para todo lo animable y tiene un saco de animaciones predefinidas.
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cambiarForma,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  void _cambiarForma() {
    final ramdom = Random();

    setState(() {
      // es la forma de lanzar el evento del button
      _width = ramdom.nextInt(300).toDouble();
      _height = ramdom.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          ramdom.nextInt(255), ramdom.nextInt(255), ramdom.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(ramdom.nextInt(100).toDouble());
    });
  }
}
