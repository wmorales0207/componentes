import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final borderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    //color:DeliveryColors.grey,
    width: 2,
    style: BorderStyle.solid,
  ),
);


final ligthTheme = ThemeData(
  appBarTheme: AppBarTheme(
    //color: DeliveryColors.white,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        headline6: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      //color: DeliveryColors.purpple,
    )),
  ),
  //canvasColor: DeliveryColors.white
  colorScheme:const ColorScheme.dark(), 
  //bottomAppBarColor: DeliveryColors.VeryLigthGrey
);


