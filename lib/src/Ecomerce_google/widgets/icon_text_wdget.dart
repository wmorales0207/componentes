import 'package:componentes/src/Ecomerce_google/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color colorText;

  const IconTextWidget(
      {super.key,
      required this.iconData,
      required this.text,
      required this.colorText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData,),
        const SizedBox(width: 5),
        SmallText(text: text, color: colorText),
      ],
    );
  }
}
