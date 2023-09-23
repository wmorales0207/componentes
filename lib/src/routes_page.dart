import 'package:componentes/src/Ecomerce_google/home/main_food_page.dart';
import 'package:componentes/src/pages/CacheNetworkImage/CacheNetworkImagePage.dart';
import 'package:componentes/src/pages/OuthPages/login_page.dart';
import 'package:componentes/src/pages/about_dialog_page.dart';
import 'package:componentes/src/pages/absob_Pointer.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/aspect_ratio_align.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/dinamic_tasks/groups_screen.dart';
import 'package:componentes/src/pages/fit_box.dart';
import 'package:componentes/src/pages/card_pages.dart';
import 'package:componentes/src/pages/contained_page.dart';
import 'package:componentes/src/pages/fontAwesomeicons/fontawesomeicons_page.dart';
import 'package:componentes/src/pages/formulario_Reactivo/initial_form.dart';
import 'package:componentes/src/pages/fruit_sell_place/screens/intro_screem.dart';
import 'package:componentes/src/pages/future_builder_Good_Practice.dart';
import 'package:componentes/src/pages/future_builder_page.dart';
import 'package:componentes/src/pages/hero_example.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/inpue_page.dart';
import 'package:componentes/src/pages/list_view_pages/other_listview_page.dart';
import 'package:componentes/src/pages/listiew_page.dart';
import 'package:componentes/src/pages/modifyproducts/modify_card.dart';
import 'package:componentes/src/pages/nuemorphicbutton.dart';
import 'package:componentes/src/pages/peliculas_app/screens/details_screen_film.dart';
import 'package:componentes/src/pages/peliculas_app/screens/home_screen.dart';
import 'package:componentes/src/pages/persona_list.dart';
import 'package:componentes/src/pages/reordenable_list.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:componentes/src/pages/state_managment/init_managment_state.dart';
import 'package:componentes/src/pages/text_editing_controller_page.dart';
import 'package:componentes/src/pages/url_launcher.dart';
import 'package:componentes/src/pages/using_keys_page.dart';
import 'package:componentes/src/pages/watasapp_Responsive/whatsapp_main.dart';
import 'package:componentes/src/settings/sreens/setting_page2.dart';
import 'package:componentes/src/value_changed/main_details_list.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicatonRoutes() => _myOwnRoutes;

final _myOwnRoutes = <String, WidgetBuilder>{
  // de esta manera se define las rutas que hay en el proy
  // esta map crea una asociacion entre lo que se se lee en el Json y la Pag que se desea cargar
  "/": (context) => const HomePage(),
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
  'Box': (context) => const BoxContain(),
  'ModifyCard': (context) => const ModifyCardPage(),
  'textfield': (context) => const TextEditingControllerPage(),
  'futureBuilder': (context) => const MyStatefulWidget(),
  PositionedTile.route: (context) => const PositionedTile(),
  ReordenableList.route: (_) => const ReordenableList(),
  GroupsScreen.route: (_) => const GroupsScreen(),
  FutureBuilderGP.route: (_) => const FutureBuilderGP(),
  NeumorphicButton.route: (_) => const NeumorphicButton(),
  UrlLauncherPage.route: (context) => const UrlLauncherPage(),
  'ReactiveForm': (context) => const ShowFormsReactiveExample(),
  'FontAwesomeIcons': (context) => const FontAwesomeIconsPage(),
  LoginPage.route: (_) => const LoginPage(),
  AspectRatioAlignPage.route: (_) => const AspectRatioAlignPage(),
  InitManagmentPage.route: (context) => const InitManagmentPage(),
  IntroScreen.route: (_) => const IntroScreen(),
  CacheNetworkImagePage.route: (context) => const CacheNetworkImagePage(),
  HomeScreen.route: (context) => const HomeScreen(),
  DetailsScreenFilm.route: (context) => const DetailsScreenFilm(),
  MainFoddPage.route: (context) => const MainFoddPage(),
  MaindetailsScreen.route: (context) => const MaindetailsScreen(),
  WhatsAppMain.route: (context) => const WhatsAppMain(),

  // si se deseara llamar desde una page a otra con pasar al metodo Navigator.pushNamed(context, String)
  // el string seria avatar 0 alert o / para ir al principal, normalmente un botton de regreso es lo que se usa
};
