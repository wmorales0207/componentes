import 'package:flutter/services.dart' show rootBundle;

// paque definido para leer Json, rootBundle es la parte del pqte que necesitamos
// esta clase es privada
class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    cargarData();
  }

  cargarData() {
    rootBundle
        .loadString('data/menu_opts.json')
        .then((value) => print(value)); // este metodo devuelve un future
  }
}

final menuProvider =
    _MenuProvider(); // de esta manera se expone la clase para ser referenciadad en otras clases.
