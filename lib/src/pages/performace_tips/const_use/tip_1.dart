import 'package:flutter/material.dart';

class Tip1 extends StatefulWidget {
  const Tip1({super.key});
  static const route = "Const";

  @override
  State<Tip1> createState() => _Tip1State();
}

class _Tip1State extends State<Tip1> {
  int counter = 0;
  void _onPressed() {
    // si se usa el set state del statefull se redibujara todo el contenido
    // la idea es solo redibujar el valor que cambia y no el background
    // con el uso de los print puedes ver quien se redibuja y quien no
     setState(() {
       counter++;
     });

  }

  @override
  Widget build(BuildContext context) {
    print("building My home page");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        child: const Icon(Icons.colorize),
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: BackgroundWidget()),
          Center(
            child: Text(
              counter.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: Colors.white, fontWeightDelta: 2),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  // adadiendo aca que esta clase tiene un constructor const se garantza que no se redibuje, y quitando el setstate del metodo onpressed
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("Building background");
    return const FadeInImage(
        // se usa este componente ya que permite poner una imagen previa mientras se gestiona la de internet
        placeholder: AssetImage('assets/darling.jpg'),
        image: NetworkImage('https://picsum.photos/200/200/?image=2'));
  }
}
