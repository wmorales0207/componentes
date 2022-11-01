import 'dart:convert';

import 'package:componentes/src/pages/modifyproducts/productmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

// normalmente en el service se encuantra la logica de l negocio , las operaciones,
// en el provider lo qe se desea observar, lo que cambia. pero aca se hara ambas cosas en elmismo lugar
class ProductService extends ChangeNotifier {
  final _urlbase = 'menelikfirebase-default-rtdb.firebaseio.com';
  bool loading =
      true; // que estara cambiando en funcion de la carga de la informacion.

  final List<Product> ProductList =
      []; // this list sera solo cargada en el load

// cuando se contruya el objeto se realizara la carga de la info
  ProductService() {
    loadingProducts();
  }

/* En este caso es necesario cargar la informacion por lo que hay que observar cuando se termina de cargar la info,
 haria falta unn bool loading   */
  Future loadingProducts() async {
    try {
      loading =
          true; // cuando se genera un cambio se debe notificar para que se generen comportamientos.
      notifyListeners();

      Uri finalUrl = Uri.https(_urlbase, '/Products.json');
      http.Response resp = await http.get(finalUrl);
      Map<String, dynamic> decodeResp = json.decode(resp.body);

      print(decodeResp);
      decodeResp.forEach((key, value) {
        final TempProduct = Product.fromMap(value);
        TempProduct.id = key;// la key es la llave pero en el modelo esta llave no existe , por lo que es una ??
        ProductList.add(TempProduct);
      });

      loading = false;
      notifyListeners();
    } catch (e) {
      print('error: ${e.toString()}');
    }

    // return resp;
  }
}
