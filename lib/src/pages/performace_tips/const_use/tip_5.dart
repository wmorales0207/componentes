import 'dart:math';

import 'package:flutter/material.dart';

class Tip5 extends StatefulWidget {
  const Tip5({super.key});
  static const route = "Animated";

  /**
   * Para evitar  realizar animated innecesarios
   */

  @override
  State<Tip5> createState() => _Tip5State();
}

class _Tip5State extends State<Tip5> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  void _onPressed() {
    setState(() {});
    counter++;
    /**
     * Cada vez que el contador aumenta la animacion se inicia, durante 600 milisec pero hacer demasiados refrescamientos
     * o sea que no tiene un buen performance
     * El counter se genera en tiempo de ejecusion por lo que no se puede usar el const
     * Solucionnnnnnnnnn
     * 
     * El Animated tiene un child  al igual que el transform. la idea seria reusar el child del animated
     * y al transform se le da ese child
     * 
     */
    _controller.forward(from: 0.0);
  }

  int counter = 0;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        splashColor: Colors.red,
        child: const Icon(Icons.slow_motion_video),
      ),
      body: AnimatedBuilder(
        /**
         * Esta animacion gira a su  child  sobre su eje Y 360 grados.
         */
        animation: _controller,
        child: CounterWigdet(
          counter: counter,
        ),
        builder: (_, reuseChildlAnimatedBuilder) {
          // Al child del animated builder es el mismo que despues viene como parametro del 
          //builder y es a el mismo al que se le aplica el Transform. claro tambien el transform 
          // tiene su child y ahi tambien funciona. Pero al parecer no es tan eficiente
          return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(
                  360 * _controller.value * (pi / 180.0),
                ),
              child: reuseChildlAnimatedBuilder);
        },
      ),
    );
  }
}

class CounterWigdet extends StatelessWidget {
  final int counter;
  const CounterWigdet({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    print("Printing Couter Building ");
    return Center(
      child: Text(
        counter.toString(),
        style:
            Theme.of(context).textTheme.headlineLarge!.apply(fontSizeDelta: 3),
      ),
    );
  }
}
