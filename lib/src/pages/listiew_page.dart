import 'package:flutter/material.dart';

class ListViewBuilderPage extends StatefulWidget {
  const ListViewBuilderPage({super.key});

  @override
  State<ListViewBuilderPage> createState() => _ListViewBuilderPageState();
}

class _ListViewBuilderPageState extends State<ListViewBuilderPage> {
  List<int> _listaNumeros = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Builder'),
      ),
      body: _crearListas(),
    );
  }

  Widget _crearListas() {
    // el  mtodo itemBuilder es el que se encaragara de redibujar los elemnetos de la lista,
    return ListView.builder(
      // este widget se redibuja para cada elemento de la lista .
      itemBuilder: (context, index) {
        // index es la posicion del elemento que esta creando en cada instante
        final imagen = _listaNumeros[index];
        return FadeInImage(
          placeholder: const AssetImage('assets/darling.jpg'),
          image: NetworkImage('https://picsum.photos/200/200/?image=$imagen'),
        );
      },
      itemCount: _listaNumeros.length,
    );
  }
}
