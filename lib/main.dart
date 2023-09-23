import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/modifyproducts/product_service.dart';
import 'package:componentes/src/pages/peliculas_app/providers/movie_provider.dart';
import 'package:componentes/src/routes_page.dart';
import 'package:componentes/src/settings/model/preferencia_usuaro.dart';
//import 'package:flutter_localizations/flutter_localizations.dart'; // esta importacion es necesaria para trabajar con los idiomas

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// con el sniped mateapp te crea la app completa para iniciar
// siempre veo que inician con un StatelessWidget parece asunto de diseno
void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Cuadno se pone cierto tipo de codigo que requiere de alguna espera en
  // en el mmain esta linea de codigo es necesaria.

// las prefrencias de usuario deben inicializarse  en la capa mas superior que se pueda , pues como es un
// future se demorara para cargar. Al hacerlo en el main da ti
//empo a que las variables tomen su valor.
  final pref = UserPreference();
  await pref
      .initPreference(); //  El main tiene que ser async para poder poder await aqui.

  runApp(const AppState());
}

////this class its created for the provider, create then on the top of the widgets tree
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    //aca se realiza la instancaicion de un provider, en este caso con acceso totan en la app
    // por defecto se cre crea de manera lazy = true, (solo hasta que un widget la necesite, si esta creada la retorna s no la crea)
    //
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductService()),
        ChangeNotifierProvider(create: (_) => MoviesProvider()),
      ],
      child: MyApp(),
    );
  }
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
      // el theme es un asunto que define el como se ve toda la app el light y dar son por defecto y con el
      // copywith se le introducen modificaciones.
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo,
        ),
      ),
      onGenerateRoute: (settings) {
        //cuando se pincha una pag que no tiene ruta definida este evento se dispara,
        // bueno para detectar cuando una pag no tiene route.
        //print('llamada ${settings.name}');

        return MaterialPageRoute(builder: (builder) => const AlertPage());
      },
    );
  }
}
