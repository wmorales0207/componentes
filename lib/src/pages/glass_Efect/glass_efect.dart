import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassEfect extends StatelessWidget {
  const GlassEfect({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: 250,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(115, 114, 49, 49),
          ),
          child: const Text("data"),
        ),
      ),
    );
  }
}

// este widget hace una animacion entre un widget y otro... segun la posicion del bool
Widget animated1() {
  return AnimatedCrossFade(
      firstChild: const Text("data"),
      secondChild: const SearchBar(),
      crossFadeState: Random(1).nextBool()
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(seconds: 200));
}

// este widget se muestra un boton con una bonita shape
Widget elevatedButton1() {
  return ElevatedButton.icon(
      onPressed: null,
      icon: const Icon(Icons.tv_off),
      style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
      label: const Text("no"));
}

// para dar varios formatos a un mismo texto  se usa el RichText
Widget diferentTextFormat() {
  return RichText(
    text: const TextSpan(
      style: TextStyle(fontSize: 20, color: Colors.amber),
      children: <TextSpan>[
        TextSpan(text: "this is an example"),
        TextSpan(
          text: "of",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w100,
              color: Colors.amberAccent),
        ),
        TextSpan(text: "Widgets"),
        TextSpan(
            text: "Flutter",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w300)),
      ],
    ),
  );
}
