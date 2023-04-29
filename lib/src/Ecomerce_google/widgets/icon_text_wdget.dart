import 'package:componentes/src/Ecomerce_google/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;

  final String text;

  const IconTextWidget({
    super.key,
    required this.iconData,
    required this.iconColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.width;
    //final double screenWidth = MediaQuery.of(context).size.height;
    final double iconSize24 = screenHeight / 35.17;

    return Row(
      children: [
        Icon(
          iconData,
          color: iconColor,
          size: iconSize24,
        ),
        const SizedBox(width: 5),
        SmallText(text: text, color: iconColor),
      ],
    );
  }
}
