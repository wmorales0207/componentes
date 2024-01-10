import 'dart:math';

import 'package:flutter/material.dart';

class Tip2 extends StatefulWidget {
  const Tip2({super.key});
  static const route = "ValueNotifier";

  @override
  State<Tip2> createState() => _Tip2State();
}

class _Tip2State extends State<Tip2> {
  
  Random random = Random();
  // se crea un ValueNotifier y dentro el objeto que se desea observar
  final myValueNotifier = ValueNotifier(DateTime.now());
  Color _getRandomColor() {
    return Colors.primaries[random.nextInt(30) % Colors.primaries.length];
  }

//aca tenemos un statefull que contiene dos elementos que cambian cuandos e hace un clic,
//el color del cuaderado y el timepo.
// el onpressed redibuja todo el contenido. no se puede poner const al back pues el tambien cambia
// por lo que se hace necesario que definir de forma directa quien se redibuja quien no
  void _onPressed() {
    /** 
     se elimina el set state ya que con el ValueListenableBuilder y el myValueNotifier
    se logra actualizar y refrescar especificamente la fecha.
    setState(() {});
    */
    // aqui se obtiene el nuevo valor de fecha.
    myValueNotifier.value = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    print("Buildind first page Tip 2");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        child: const Icon(Icons.colorize),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            // aqui al ValueListenableBuilder le paso el valor que contiene el ValueNotifier que el datetime
            //necesita a este ValueListenableBuilder para refrescar el valor
            // y en el onpressed se le pone el valor nuevo, el nuevo valor referescado
            // hay varias formas de lograr esto.. lo importante es definir que no haga el rebuild de todo
            // solo has un rebuild de lo que se desea que cambie.
            child: ValueListenableBuilder<DateTime>(
              valueListenable: myValueNotifier,
              builder: (BuildContext context, dynamic value, Widget? child) {
                // de esta manera es el value el que cambia cada vez que refrezca.
                return _BackgroundWidget(value);
              },
            ),
          ),
          Center(
            child: Container(
              width: 150,
              height: 150,
              color: _getRandomColor(),
            ),
          )
        ],
      ),
    );
  }
}

class _BackgroundWidget extends StatelessWidget {
  const _BackgroundWidget(this.dateTime);
  final DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    print("Building background tip 2");
    return Text("${dateTime.minute}: ${dateTime.second}");
  }
}
