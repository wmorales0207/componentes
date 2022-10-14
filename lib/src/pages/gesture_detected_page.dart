import 'package:flutter/material.dart';

class GestureDetectedpage extends StatefulWidget {
  const GestureDetectedpage({super.key});

  @override
  State<GestureDetectedpage> createState() => _GestureDetectedpageState();
}

class _GestureDetectedpageState extends State<GestureDetectedpage> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: Container(
          width: double.infinity,
          height: 250.0,
          color: Colors.blueGrey,
          child: AnimatedAlign(// el animated anima a su child. le aplica todas esas propiedades a su child
            alignment: (selected) ? Alignment.topRight : Alignment.bottomLeft,
            duration: const Duration(seconds: 2),
            curve: Curves.fastLinearToSlowEaseIn,
            child: const FlutterLogo(size: 25.0),
          ),
        ),
      ),
    );
  }
}
