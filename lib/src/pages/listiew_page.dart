import 'dart:async';

import 'package:flutter/material.dart';

class ListViewBuilderPage extends StatefulWidget {
  const ListViewBuilderPage({super.key});

  @override
  State<ListViewBuilderPage> createState() => _ListViewBuilderPageState();
}

class _ListViewBuilderPageState extends State<ListViewBuilderPage> {
  final ScrollController _scrollController = ScrollController();

  final List<int> _listaNumeros = [];

  var _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    // este metodo se ejecuta antes de pintarse todo, puede usarse para cargar cosas antes de que se pinte la app.
    super.initState();
    _agegar10(); // este metodo llena la

    _scrollController.addListener(() {
      // ESTA funcion no fue necesaria cuando se mostro en el texbox lo seleccion de la fecha,
      //sera por el comportamiento del componente
      // print('se mueve');
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // si la posicion de pixeles del scrol esta en su poso max sig que esta en el final
        //_agegar10();
        _fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Builder'),
      ),
      body: Stack(
        // este componente es parecido a Row o Comumn , lo que este apila los widget , uno encima de otros
        children: [
          _crearListas(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearListas() {
    // el  mtodo itemBuilder es el que se encaragara de redibujar los elemnetos de la lista,
    return RefreshIndicator(
      onRefresh:
          _obtenerPagina1, // este metodo se llama sin () porque no se desea que se ejecute en el momento, solo cuando se cumplan det condiciones.
      child: ListView.builder(
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
      ),
    );
  }

  void _agegar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});
    const duration = Duration(seconds: 4);

    return Timer(duration,
        respuestaHTTP); // los parentesis no se ponen en la funcion respuestaHTTP ya que la ejecutaria en el instante y la idea
    // es que matenga la referencia para cuando haga falta. aca se le pasa el tiempo que debe transcurrir antes que se ejecute el segundo parametro,
    // el segundo parametro es una funcion que se ejecuta pasado el tiempo definido en el Duration.
  }

  void respuestaHTTP() {
    _isLoading =
        false; // De esta forma si se detecta qu hay mas fotos en el scroll se define un comportamiento
    _scrollController.animateTo(
        _scrollController.position.pixels +
            100, // con esto se muestra parte de la siguente foto
        duration: const Duration(
            milliseconds: 250), // se define el tiempo que durara la animacion
        curve: Curves.fastOutSlowIn); // el tipo de animacion elegida.
  }

  @override
  void dispose() {
    super.dispose();
    // que pasa en este widget, que los listener se crean todas las veces que se accede a esta interfaz y es necesario liberar los recursos, , eliminanrlos
    _scrollController.dispose();
  }

  Widget _crearLoading() {
    // este metodo muestra un loading que depende la la var loading
    if (_isLoading) {
      return const Column(
        // toda esta info esta asociada a poder centrar el widget en el centro inferir de la pantalla.
        children: [
          Row(
            children: [
              // este CircularProgressIndicator debe depender de otros componentes pues el setState debe jugar su papel
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      );
    } else {
      return Container(); // siempre se debe devolver un widget y de esta forma se logra una devolucion que no trae problemas.
    }
  }

  Future<void> _obtenerPagina1() async {
    // me llama la atencion de que esta es una funcion que no devuelve nada sin embargo tiene un return
    // no se si por ser un future pero me causa dudas
    const duration = Duration(seconds: 2);
    Timer(
      duration,
      () {
        _listaNumeros.clear();
        _agegar10();
      },
    );

    return Future.delayed(duration);
  }
}
