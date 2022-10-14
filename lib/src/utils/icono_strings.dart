import 'package:flutter/material.dart';

// aca en este . dart se creo un map que machea el nombre de un icono con el componente
// una llamada al metodo geticon carga el asignado en el map.
final _icons = <String, IconData>{
  "add_alert": Icons.add_alert,
  "Accesibility": Icons.accessibility,
  "folder_open": Icons.folder_open,
  "donut_large": Icons.donut_large,
  "input": Icons.input,
  "tune": Icons.tune,
  "list": Icons.list,
  "point_of_sale": Icons.point_of_sale,
  "add_box_rounded": Icons.add_box_rounded,
  "person_add_rounded": Icons.person_add_rounded,
  "about": Icons.album_outlined,
  "hero": Icons.hexagon_rounded,
  
};

Icon getIcon(String nombreIcono) {
  return Icon(
    _icons[nombreIcono],
    color: Colors.blue,
  );
}
