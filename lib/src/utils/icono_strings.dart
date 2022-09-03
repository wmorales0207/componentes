import 'package:flutter/material.dart';

// aca en este . dart se creo un map que machea el nombre de un icono con el componente
// una llamada al metodo geticon carga el asignado en el map.
final _icons = <String, IconData>{
  "add_alert": Icons.add_alert,
  "Accesibility": Icons.accessibility,
  "folder_open": Icons.folder_open,
  "donut_large": Icons.donut_large
};

Icon getIcon(String nombreIcono) {
  return Icon(
    _icons[nombreIcono],
    color: Colors.blue,
  );
}
