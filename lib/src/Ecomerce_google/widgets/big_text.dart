import 'package:flutter/material.dart';

class BigTexts extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;

  BigTexts(
      {super.key,
      this.size = 0,
      this.textOverflow = TextOverflow.ellipsis,
      this.color = const Color(0XFF89dad0), // aqui se pudo haber usado el
      required this.text});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.width;
    //final double screenWidth = MediaQuery.of(context).size.height;

    //
    final double fonts20 = screenHeight / 42.2;
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
        fontFamily:
            "Roboto", //check roboto family dowload and configure pupspec.yaml
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size == 0 ? fonts20 : size,
      ),
    );
  }
}
