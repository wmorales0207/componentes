import 'package:flutter/material.dart';

class StreamBuilderPage extends StatefulWidget {
  const StreamBuilderPage({super.key});

  @override
  State<StreamBuilderPage> createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  //// this metod return an endless aomunt of data.
  Stream<int?> getData() async* {
    await Future.delayed(const Duration(seconds: 4));
    yield 1;

    await Future.delayed(const Duration(seconds: 3));
    yield 2;

    await Future.delayed(const Duration(seconds: 1));
    yield 4;
    await Future.delayed(const Duration(seconds: 2));
    yield 5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('+ Stream Builder'),
      ),
      body: StreamBuilder<int?>(
        stream: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text(' error');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Waiting');
          } else if (snapshot.hasData) {
            int number = snapshot.data!;
            return Text(' the $number');
          } else {
            const Text('No data');
          }

          return Container();
        },
      ),
    );
  }
}
