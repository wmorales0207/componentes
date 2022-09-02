import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
//import 'package:componentes/src/pages/home_temp.dart';
import 'package:flutter/material.dart';

// con el sniped mateapp te crea la app completa para iniciar
// siempre veo que inician con un StatelessWidget parece asunto de diseno
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes',
      debugShowCheckedModeBanner: false,
      //home:HomePage(),
      initialRoute: '/', // define una ruta por defecto
      routes: <String, WidgetBuilder>{
        // de esta manera se define las rutas que hay en el proy
        // esta map crea una asociacion entre lo que se se lee en el Json y la Pag que se desea cargar
        "/": (context) => const HomePage(),
        "alert": (context) => const AlertPage(),
        "avatar": (context) => const AvatarPage(),
        // si se deseara llamar desde una page a otra con pasar al metodo Navigator.pushNamed(context, String)
        // el string seria avatar 0 alert o / para ir al principal, normalmente un botton de regreso es lo que se usa
      },
    );
  }
}
