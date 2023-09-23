import 'package:componentes/src/pages/state_managment/main_non_block.dart';
import 'package:flutter/material.dart';

class CounterInhereted extends InheritedWidget {
  // este child que recibe por parametros es el hijo que tendra dentro el widgtet..
  // o lo que es lo mismo la info que se desea mover o trasladar.
  const CounterInhereted({super.key,   required this.bloc, required super.child});
  
  final MainNonBlock bloc;
  

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
// aca se comparte el inherited mediante un static.
// con el findAncestorWidgetOfExactType se busca en el arbol la instancia del inherited que me devuelva el bloc.
// A la hora de usarse el inherited se debe poner en una rama superior de donde se va a usar la info a la que se
// desea accder.

  static MainNonBlock of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<CounterInhereted>()!.bloc;
}
