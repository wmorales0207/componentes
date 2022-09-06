import 'package:flutter/material.dart';

class ListViewBuilderPage extends StatefulWidget {
  const ListViewBuilderPage({super.key});

  @override
  State<ListViewBuilderPage> createState() => _ListViewBuilderPageState();
}

class _ListViewBuilderPageState extends State<ListViewBuilderPage> {
  ScrollController _scrollController = ScrollController();

  List<int> _listaNumeros = [];

  var _ultimoItem = 0;

  @override
  void initState() {
    // este metodo se ejecuta antes de pintarse todo, puede usarse para cargar cosas antes de que se pinte la app.
    super.initState();
    _agegar10(); // este metodo llena la lista

    _scrollController.addListener(() {
      // ESTA funcion no fue necesaria cuando se mostro en el texbox lo seleccion de la fecha,
      //sera por el comportamiento del componente
      // print('se mueve');
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // si la posicion de pixeles del scrol esta en su poso max sig que esta en el final
        _agegar10();
      }
    });
  }

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
      controller:
          _scrollController, // esta propiedad es usada para poder ponerle el valor al widget, esto se uso en el Textbox cuando se disparo un modal que te permitia
      // sacar la fecha y con el controller que es un especie de listener que actua ante un evento.
      itemBuilder: (context, index) {
        // index es la posicion del elemento que esta creando en cada instante
        final imagen = _listaNumeros[index];
        return FadeInImage(
          // se usa este componente ya que permite poner una imagen previa mientras se gestiona la de internet
          placeholder: const AssetImage('assets/darling.jpg'),
          image: NetworkImage('https://picsum.photos/200/200/?image=$imagen'),
        );
      },
      itemCount: _listaNumeros.length,
    );
  }

  void _agegar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }
}
