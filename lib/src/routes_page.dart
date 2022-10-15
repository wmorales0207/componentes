import 'package:componentes/src/pages/about_dialog_page.dart';
import 'package:componentes/src/pages/absob_Pointer.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_pages.dart';
import 'package:componentes/src/pages/contained_page.dart';
import 'package:componentes/src/pages/hero_example.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/inpue_page.dart';
import 'package:componentes/src/pages/list_view_pages/other_listview_page.dart';
import 'package:componentes/src/pages/listiew_page.dart';
import 'package:componentes/src/pages/persona_list.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:componentes/src/settings/sreens/setting_page2.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicatonRoutes() => _myOwnRoutes;

final _myOwnRoutes = <String, WidgetBuilder>{
  // de esta manera se define las rutas que hay en el proy
  // esta map crea una asociacion entre lo que se se lee en el Json y la Pag que se desea cargar
  "/": (context) => HomePage(),
  "person": (context) => const PersonList(),

  "List2": (context) => const OtherListPage(),

  "alert": (context) => const AlertPage(),
  "avatar": (context) => const AvatarPage(),
  "card": (context) => const CardPage(),
  "animatedContained": (context) => const AnimatedContainerPage(),
  "inputs": (context) => const InputPage(),
  "slider": (context) => const SliderPAge(),
  "list": (context) => const ListViewBuilderPage(),
  "absorbPointer": (context) => const AbsorbPointerPage(),
  "container": (context) => const ContainedPage(),
  "About": (context) => const AboutDialogPage(),
  "Hero": (context) => const HeroExample(),
  'SettingPage2': (context) => const SettingPage2(),

  // si se deseara llamar desde una page a otra con pasar al metodo Navigator.pushNamed(context, String)
  // el string seria avatar 0 alert o / para ir al principal, normalmente un botton de regreso es lo que se usa
};
