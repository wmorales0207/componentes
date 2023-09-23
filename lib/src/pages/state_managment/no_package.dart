import 'package:componentes/src/pages/state_managment/counter_inhereted.dart';
import 'package:componentes/src/pages/state_managment/counter_repository.dart';
import 'package:componentes/src/pages/state_managment/main_non_block.dart';
import 'package:flutter/material.dart';

import 'dialog_utils.dart';

class NoPackgePage extends StatelessWidget {
  static const route = 'NoPackgePage';
  NoPackgePage({super.key});
  final service = CounterService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // a este nivel se sera el inherited se le pone de child la clase No package y se le le a;ade la dependencia
      // que en este caso es la info que se desea mover, o sea la clase que hereda de Change Notifier.
      home: CounterInhereted(
        bloc: MainNonBlock(service),
        child: const NoPackage(
          title: 'No pa',
        ),
      ),
    );
  }
}

class NoPackage extends StatefulWidget {
  const NoPackage({super.key, this.title});
  final String? title;
// service se injecta desde la clase superior del arbol y se ijecta la dependencia pero a traves de la interfaz creada.
  //final CounterRepository service;

  @override
  State<NoPackage> createState() => _NoPackageState();
}

class _NoPackageState extends State<NoPackage> {
  // el objeto bloc necesita ser inicializado peo no deja coger a  widget.service aca , por lo que hay que hacerlo en el INITS.
  // el uso de los inherited permite que no haya que pasar los objetos por todo el arbol hasta llegara a dondes e necesita

  late MainNonBlock bloc;

// para a;adir esta logica a la ejecusion una de as vias es hacer que el bloc escuche o se actualice con
// cu
  void listenCounter() {
    if (bloc.counter > 0 && bloc.counter % 5 == 0) {
      showHelloDialog(context, 'none');
    }
  }

  @override
  void initState() {
    // este metodo bsca la instancia del inherited y la instancia y con eso el objeto Bloc ...
    bloc = CounterInhereted.of(context);
    // de esta manera hacemos qu el metodo listen counter escuche las modificaciones que se realizan
    // en este caso mostraria un msg cuando llegue a un multiplo de 5. ya que ademas no se puede mostrar un
    // dialog dentro del Build.
    bloc.addListener(listenCounter);
    super.initState();
  }

  @override
  void dispose() {
    bloc.removeListener(listenCounter);
    super.dispose();
  }

  void incrementCounter() {
    bloc.increment();
    //la varcounter del service contiene el valor incrementado
    if (bloc.counter > 0 && bloc.counter % 5 == 0) {
      showHelloDialog(context, 'none');
      // showDialog(
      //   context: context,
      //   builder: (context) => const Text('data'),
      // );

      // showDialog(
      //     context: context,
      //     builder: (_) {
      //       return const AlertDialog(title: Text('heeloo'));
      //     });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? 'No data '),
        ),
        body: Column(
          children: [
            
            _CounterBody(counter: bloc.counter),
          ],
        ),
        floatingActionButton: const CounterButton());
  }
}

class _CounterBody extends StatelessWidget {
  const _CounterBody({
    Key? key,
    required this.counter,
  }) : super(key: key);
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text('You have Pushed the button too many times'),
        CounterText(counter: counter),
      ],
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({
    Key? key,
    required this.counter,
  }) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) {
    final bloc = CounterInhereted.of(context);
    // este componente hace la funcion de escuchar , pues en el animation se le pasa un objecto que que herede de chage notifier o
    return Center(
      child: AnimatedBuilder(
        animation: bloc,
        builder: (BuildContext context, _) {
          return Text(
            '${bloc.counter}',
            style: Theme.of(context).textTheme.headlineMedium,
          );
        },
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  const CounterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = CounterInhereted.of(context);

    return FloatingActionButton(
      onPressed: () async {
        await bloc.increment();
      },
      tooltip: 'increment',
      child: const Icon(Icons.add),
    );
  }
}
