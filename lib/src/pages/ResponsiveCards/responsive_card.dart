import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResponsiveCards extends StatelessWidget {
  const ResponsiveCards({super.key});
/**Primero saber que la rotacion se controla a dos niveles  se puede entrar a la configuracion nativa
 * para ir a la config nativa que es diferente su ubicacion en dependecia del SO.
 * ahi puedes definir si deseas que rote .. se se define aca no hay forma de que se pueda hacer dentro del codigo
 * Para android se entra al android manifest principal, del main en android y se a;ade la linea correspondiente
 * si buscas en internet andrioid screen orientation te da la linea que debes poner para que no ocurra la rotacion
 * el OrientationBuilder hace un calculo de largo y ancho y a partir de ahi saca que esta landcape o no 
 *  */
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations(DeviceOrientation.values); con esta linea limitamos si esta landcape o no
    final orientation = MediaQuery.of(context)
        .orientation; // aca si se define si esta landcape o no

    return Scaffold(
      backgroundColor: const Color(0xFF212239),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              "Your Cards",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: AnimatedSwitcher(
                // usando este elemento aca logramos realizar una animacion cuando se realize la rotacion
                duration: const Duration(seconds: 2),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    // por defecto se usa un FadeTransition para lograr esto
                    scale: animation,
                    child: child,
                  );
                },
                child: orientation == Orientation.landscape
                    ? ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return _CardItem(
                            color: Colors
                                .primaries[index % Colors.primaries.length],
                          );
                        })
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return _CardItem(
                            color: Colors
                                .primaries[index % Colors.primaries.length],
                          );
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  final Color color;
  const _CardItem({required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.3), color],
                stops: const [0.3, 1.0]),
            color: color,
            borderRadius: BorderRadius.circular(20)),
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("\$158.72"),
              Spacer(),
              Text("4020************3245"),
              Text("Wil verloper"),
            ],
          ),
        ),
      ),
    );
  }
}
