import 'package:componentes/src/provider/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //print(menuProvider.cargarData()); // imprime por consola lo que leyo del JSON.
    print(menuProvider
        .opciones); //  aca aunque se ahce una llamada a la clase menu provider,
    // en la consola no se muesra resultado devido a que el hot reload no crea nuevas instancias y hay que hacer un Hot restart
    return ListView(
      children: _listaItems(),
    );
  }

  List<Widget> _listaItems() {
    return const [
      ListTile(
        title: Text('data'),
      ),
      Divider(
        color: Colors.amberAccent,
      ),
      ListTile(
        title: Text('data'),
      ),
      Divider(
        color: Colors.amberAccent,
      ),
      ListTile(
        title: Text('data'),
      ),
      Divider(
        color: Colors.amberAccent,
      ),
    ];
  }
}
