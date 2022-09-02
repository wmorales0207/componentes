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
          //children: _crearItems(),
          //children: _crearItems(),
          ),
    );
  }

  List<Widget> _crearItems() {
    List listValue = ['uno', 'dos', 'tres'];

    List<Widget> list = [];
    for (var element in listValue) {
      final auxWidget = ListTile(
        title: Text(element.toString()),
      );
      list.add(auxWidget);
      list.add(const Divider(
        color: Colors.black,
      ));
    }
    return list;
  }

  List<Widget> _crearItemsCorta() {
    List listValue = ['uno', 'dos', 'tres', 'tres', 'tres', 'seis'];
    List<Widget> salida = [];

    var output = listValue.map((e) => {
          ListTile(
            title: e,
          )
        });
    // la variable output obtiene un Iterable<Set<Widget>> por lo que es necesario metersed entro parasacar la info
    output.forEach((element) {
      element.forEach((element) {
        salida.add(element);
      });
    });
    return salida;
  }
}