import 'package:componentes/src/pages/OuthPages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  "Fitted Box": Icons.fit_screen_outlined,
  "card": Icons.card_travel,
  "Change": Icons.change_circle,
  "futureBuilder": Icons.query_builder_rounded,
  "form": Icons.format_align_justify,
  "Post": Icons.insert_emoticon,
  "Get": Icons.get_app_rounded,
  "Put": Icons.get_app_rounded,
  "Del": Icons.get_app_rounded,
  "key": Icons.key_off_rounded,
  'TaskGroups': Icons.task,
  'FutureBuilder': Icons.flutter_dash_outlined,
  'NeumorphicButton': Icons.near_me_outlined,
  'ReactiveForm': Icons.add_reaction,
  'FontAwesomeIcons': Icons.font_download,
  'OuthFirebase': Icons.fire_extinguisher,
  'Fruits': Icons.local_grocery_store_outlined,
  'cacheNetworkImage': Icons.network_check,
  'Peliculas': FontAwesomeIcons.film,
  'MainFoddPage': FontAwesomeIcons.bowlFood,
  'ValueChanged': FontAwesomeIcons.chargingStation,
  'WhatsAppMain': FontAwesomeIcons.whatsapp,

  
};

Icon getIcon(String nombreIcono) {
  return Icon(
    _icons[nombreIcono],
    color: Colors.blue,
  );
}
