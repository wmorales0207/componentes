import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  const HomePageTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Componentes temp"),
      ),
      body: ListView(
        children: _crearItems(),
        //children: _crearItemsCorta(),
      ),
    );
  }

  List<Widget> _crearItems() {
    List listValue = ['uno', 'dos', 'tres', 'cuatro', 'cuatro'];

    List<Widget> list = [];
    for (var element in listValue) {
      final auxWidget = ListTile(
        title: Text(element.toString()),
        subtitle: const Text('Any thing'),
        leading:
            const Icon(Icons.account_balance_wallet), // el icono que va delante
        trailing:
            const Icon(Icons.keyboard_arrow_right), // el icono que va detras
        onTap: () {}, // habilita el clic
      );
      list.add(auxWidget);
      list.add(const Divider(
        color: Colors.black,
      ));
    }
    return list;
  }

//revisar este metodo que tiene problemas.
  List<Widget> _crearItemsCorta() {
    List listValue = ['uno', 'dos', 'tres', 'tres', 'tres', 'seis'];
    List<Widget> salida = [];

    var output = listValue.map((e) => {
          ListTile(
            title: e,
          )
        });
    // la variable output obtiene un Iterable<Set<Widget>> por lo que es necesario metersed entro parasacar la info
    for (var element in output) {
      for (var element in element) {
        salida.add(element);
      }
    }
    return salida;
  }
}
