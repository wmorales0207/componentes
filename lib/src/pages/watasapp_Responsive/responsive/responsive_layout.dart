import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget movileScreenLayout;
  final Widget webScreenLayout;

  const ResponsiveLayout(
      {super.key,
      required this.movileScreenLayout,
      required this.webScreenLayout});

// necesita el layout para defnir los tama;os y las proporciones, de esta manera poner aca toda la logica de los tama;os. de devices
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {// el valor es 900 lo puse en 600 para probar en mi cel
          return webScreenLayout;
          // screen web
        } else {
          //movile screen
          return movileScreenLayout;
        }
      },
    );
  }
}
