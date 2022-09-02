import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

// paque definido para leer Json, rootBundle es la parte del pqte que necesitamos
// esta clase es privada
class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    cargarData();
  }
   // esta funcion devuelve un future que la forma mas conveniente.  
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
    _MenuProvider(); // de esta manera se expone la clase para ser referenciadad en otras clases.
