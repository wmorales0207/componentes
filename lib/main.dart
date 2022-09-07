import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes_page.dart';
//import 'package:flutter_localizations/flutter_localizations.dart'; // esta importacion es necesaria para trabajar con los idiomas

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
      // esta configuracion es necesaria para que se reconozcan los idiomas, se obtuvo de la documentacion de Flutter pag oficial
      // localizationsDelegates:  [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // // esta es la segunda parte de la config de los idiomas , sonn los idiomas permitodos.
      // supportedLocales: const [
      //   Locale('es', 'ES'),
      //   Locale('en', 'US'),
      // ],

      //home:HomePage(),
      initialRoute: '/', // define una ruta por defecto
      routes: getApplicatonRoutes(),
      onGenerateRoute: (settings) {
        //cuando se pincha una pag que no tiene ruta definida este evento se dispara,
        // bueno para detectar cuando una pag no tiene route.
        //print('llamada ${settings.name}');
        return MaterialPageRoute(builder: (builder) => const AlertPage());
      },
    );
  }
}
