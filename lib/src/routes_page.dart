import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_pages.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/inpue_page.dart';
import 'package:componentes/src/pages/listiew_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicatonRoutes() => _myOwnRoutes;

final _myOwnRoutes = <String, WidgetBuilder>{
  // de esta manera se define las rutas que hay en el proy
  // esta map crea una asociacion entre lo que se se lee en el Json y la Pag que se desea cargar
  "/": (context) => const HomePage(),
  "alert": (context) => const AlertPage(),
  "avatar": (context) => const AvatarPage(),
  "card": (context) => const CardPage(),
  "animatedContained": (context) => const AnimatedContainerPage(),
  "inputs": (context) => const InputPage(),
  "slider": (context) => const SliderPAge(),
  "list": (context) => const ListViewBuilderPage(),

  // si se deseara llamar desde una page a otra con pasar al metodo Navigator.pushNamed(context, String)
  // el string seria avatar 0 alert o / para ir al principal, normalmente un botton de regreso es lo que se usa
};
