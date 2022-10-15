import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes_page.dart';
import 'package:componentes/src/settings/model/preferencia_usuaro.dart';
//import 'package:flutter_localizations/flutter_localizations.dart'; // esta importacion es necesaria para trabajar con los idiomas

import 'package:flutter/material.dart';

// con el sniped mateapp te crea la app completa para iniciar
// siempre veo que inician con un StatelessWidget parece asunto de diseno
void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Cuadno se pone cierto tipo de codigo que requiere de alguna espera en
  // en el mmain esta linea de codigo es necesaria.

// las prefrencias de usuario deben inicializarse  en la capa mas superior que se pueda , pues como es un
// future se demorara para cargar. Al hacerlo en el main da tiempo a que las variables tomen su valor.
  final _pref = UserPreference();
  await _pref
      .initPreference(); //  El main tiene que ser async para poder poder await aqui.

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _pref = UserPreference();
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
      initialRoute: _pref.ultimaPagina, // define una ruta por defecto
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
