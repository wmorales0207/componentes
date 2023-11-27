import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

// De esta manera se realiza una exportacion del rootBundle o se hace visible, necesario para  leer el Json.
// paquete definido para leer Json, rootBundle es la parte del pqte que necesitamos y de esa manera se define
// esta clase es privada
class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    cargarData();
  }
  // esta funcion devuelve un future que la forma mas conveniente. El Future permite la ejecucion 
  //Un future tiene varios estados cuando esta buscando datos, cuando se resuelve y cuando da un error.
  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp); // usa la libreria import 'dart:convert';
    //print('data map :' + dataMap['rutas']);
    opciones = dataMap[
        'rutas']; // de esta forma opciones se ajusta a cualquiera que sea el resultado
    // este metodo devuelve un future
    return opciones; // esta
  }
}

final menuProvider =
    _MenuProvider(); // de esta manera se expone la instancia para ser referenciada, tambien solo se usara una vez
