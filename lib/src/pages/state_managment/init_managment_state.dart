import 'package:componentes/src/pages/state_managment/no_package.dart';
import 'package:flutter/material.dart';

class InitManagmentPage extends StatelessWidget {
  static const route = 'stateManagment';
  const InitManagmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    flutterBloc() {}

    providerPackage() {}

    noPackage() {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => NoPackgePage()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Managment Examples'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton.icon(
                onPressed: noPackage,
                icon: const Icon(Icons.call_end),
                label: const Text('No Package')),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                onPressed: providerPackage,
                icon: const Icon(Icons.personal_video),
                label: const Text('provider')),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                onPressed: flutterBloc,
                icon: const Icon(Icons.block),
                label: const Text('Flutter Bloc')),
          ],
        ),
      ),
    );
  }
}
