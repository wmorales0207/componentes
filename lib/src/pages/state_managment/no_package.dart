import 'package:flutter/material.dart';

import 'dialog_utils.dart';

class NoPackgePage extends StatelessWidget {
  static const route = 'NoPackgePage';
  const NoPackgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoPackage(),
    );
  }
}

class NoPackage extends StatefulWidget {
  NoPackage({super.key, this.title});
  final String? title;

  @override
  State<NoPackage> createState() => _NoPackageState();
}

class _NoPackageState extends State<NoPackage> {
  int _counter = 0;
  void incrementCounter() {
    setState(() {
      _counter++;
    });
    if (_counter > 0 && _counter % 5 == 0) {
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
            _CounterBody(
              counter: _counter,
            ),
            Text(
              _counter.toString(),
              style: _counter.isEven
                  ? TextStyle(color: Colors.red)
                  : TextStyle(color: Colors.purple.shade400),
            ),
          ],
        ),
        floatingActionButton: CounterButton(
          onPressed: incrementCounter,
        ));
  }
}

class CounterButton extends StatelessWidget {
  const CounterButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'increment',
      child: const Icon(Icons.add),
    );
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
    return Center(
      child: Column(
        children: <Widget>[
          const Text('You have Pushed the button too many times'),
          CounterText(counter: counter),
        ],
      ),
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
    return Text(
      '$counter ',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
