import 'package:flutter/material.dart';

class Tip3 extends StatefulWidget {
  const Tip3({super.key});
  static const route = "widget";

  @override
  State<Tip3> createState() => _Tip3State();
}

class _Tip3State extends State<Tip3> {
/**La esencia de este tip viene de definir si es mejro crear wwidgets o metodos.
 * al parecer la creacion de widgets es mas eficiente que de metodos.
 * flutter tiene mejores mecanismos de performace para los widgets que para los metodos.
 * en el caso de las animaciones el animated no se da cuenta que el circle y el squer son diferentes
 * y no los anima... solo es un pequeno ejemplo
 * 
 */

  bool showCircle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: showCircle
                  ? const NewWidgetcircle()
                  : const NewWidgetsquare(),
            ),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    showCircle = !showCircle;
                  });
                },
                child: const Text(
                    "Clic me to fade transition between square and circle"))
          ],
        ),
      ),
    );
  }
}

// Widget square() {
//   return NewWidgetsquare();
// }

class NewWidgetsquare extends StatelessWidget {
  const NewWidgetsquare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
    );
  }
}

// Widget circle() {
//   return NewWidgetcircle();
// }

class NewWidgetcircle extends StatelessWidget {
  const NewWidgetcircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.amber,
      ),
    );
  }
}
