// ignore: file_names
import 'package:flutter/material.dart';

class AbsorbPointerPage extends StatefulWidget {
  const AbsorbPointerPage({super.key});

  @override
  State<AbsorbPointerPage> createState() => _AbsorbPointerPageState();
}

class _AbsorbPointerPageState extends State<AbsorbPointerPage> {
  bool _isAbsorbing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Absorb Point"),
      ),
      body: AbsorbPointer(
        absorbing:
            _isAbsorbing, // cambiamos la propiedad y se la asignamos al AbsorbPointer.
        child: const HomeBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _isAbsorbing =
              !_isAbsorbing; // de esta manera logramos que cuadno se aprite el button cambie el estado de isAbsorbing
          setState(
              () {}); //  solo con llamar al proc de setState ya permite redibujarse y la ejucusion del codigo
        },
        child: Icon(
          (_isAbsorbing) ? Icons.lock : Icons.lock_open,
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // el containes es necesario pues tiene un grupo de opciones que te permiten mover mejor el widget que sea
        padding: const EdgeInsets.symmetric(
            horizontal: 20.0), // separa de los bordes los botones
        child: Column(
          children: [
            const CustomOutLiinedButton(
              width: double.infinity,
            ),
            Row(
              // como son 2 botones juntos el row los ubica y se les pueden aplicar operaciones de organizacon a los 2.

              children: const [
                CustomOutLiinedButton(
                  width: 200.0,
                ),
                Expanded(
                    child: CustomOutLiinedButton(
                  width: double.infinity,
                )),
              ],
            ),
            Row(
              // como son 2 botones juntos el row los ubica y se les pueden aplicar operaciones de organizacon a los 2.

              children: const [
                Expanded(
                    child: CustomOutLiinedButton(
                  width: double.infinity,
                )),
                CustomOutLiinedButton(
                  width: 200.0,
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                ),
                child: ListView.builder(
                    physics:
                        BouncingScrollPhysics(), // look the same in android or ios
                    itemBuilder: (_, i) => ListTile(
                          title: Text('${i + 1}'),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Como hay que crear varios botones hay codigo que se reutilizara y de esta manera podemos hacer llamadas del widget personalizado
// que acabamos de crear..
class CustomOutLiinedButton extends StatelessWidget {
  final double width, heigth;
  const CustomOutLiinedButton({
    Key? key,
    this.width = 150,
    this.heigth = 150,
    //Key? key,  required this.width,  required this.heigth, si los pongo requeridos no me permitira inicializarlos,me obligara a pasarlos por parametros
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5.0),
        width: double.infinity,
        height: 300.0,
        child: OutlinedButton(onPressed: (() {}), child: const Text("Button")));
  }
}
