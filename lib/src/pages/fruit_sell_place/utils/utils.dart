import 'package:flutter/material.dart';

final boxShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.5),
    blurRadius: 1,
    spreadRadius: 1,
    offset: const Offset(1, 1),
  )
];

Widget iconWidget(IconData iconData, bool doExists) {
  return Container(
    width: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: boxShadow,
      shape: BoxShape.circle,
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Icon(iconData),
        if (doExists)
          Positioned(
              right: 12,
              top: 30,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.primaries.first,
                ),
              ))
      ],
    ),
  );
}

Widget priceWidget(String price) {
  return RichText(
    text: TextSpan(children: [
      TextSpan(
        text: "\$$price",
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      const TextSpan(
        text:"/kg",
        style: TextStyle(
          color: Colors.black38, 
          fontWeight: FontWeight.bold
        )
      )
    ]),
  );
}
