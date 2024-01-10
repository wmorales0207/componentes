import 'package:flutter/material.dart';

class Tip6 extends StatefulWidget {
  const Tip6({super.key});
  static const route = "ListViewGridView";

  @override
  State<Tip6> createState() => _Tip6State();
}

class _Tip6State extends State<Tip6> {
  final items = List.generate(20, (index) => _MyItems(index: index));
  /**
   * Desde el punto de vista del listview de forma general esta opyimizado siempre y cuando no hayan otros listview
   * Pues su performance se complica cuando hay otros o cuando se le aplica el:: shrinkWrap: true,
   * esta caracteristca esta asociada a que el componente tiene que calcular eltamano de todos los elementos
   * de la lista 
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        
        children: items,
      ),
    );
  }
}

class _MyItems extends StatelessWidget {
  final int index;

  const _MyItems({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    print("building my  ${index}");
    return Container(
      height: 200,
      color: Colors.primaries[index % Colors.primaries.length],
      child: FittedBox(child: Text(index.toString())),
    );
  }
}
