import 'package:flutter/material.dart';

class Tip4 extends StatefulWidget {
  const Tip4({super.key});
  static const route = "ItemExtend";
  /**
   * Este es el caso de cuando hay muchos items se debe usar ItemExtends
   */

  @override
  State<Tip4> createState() => _Tip4State();
}

class _Tip4State extends State<Tip4> {
  final widgets = List.generate(
    //se pueden poner 2000000 y salta raipo cuando se usa el itemExtent del listview.
      20,
      (index) => Container(
          height: 200.0,
          color: Colors.primaries[index % Colors.primaries.length],
          child: ListTile(title: Text("index $index"))));

  final scrollController = ScrollController();

  void _onPressed() {
    // este metodo permite que salte al ultmo elemento del scroll
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        splashColor: Colors.red,
        child: const Icon(Icons.slow_motion_video),
      ),
      body: ListView(
        // este itemExtent le dice al listview que sus hijos tendran un tamano fijo y eso acelera el proceso
        // de creacion de los hijos si los hijos son de tamanos variables ell itemExtent no te serviria
        itemExtent: 200,
        controller: scrollController,
        children: widgets,
      ),
    );
  }
}
