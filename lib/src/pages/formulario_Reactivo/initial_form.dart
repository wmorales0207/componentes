import 'package:componentes/src/pages/formulario_Reactivo/no_reactive_form.dart';
import 'package:componentes/src/pages/formulario_Reactivo/reactive_form.dart';
import 'package:flutter/material.dart';

class ShowFormsReactiveExample extends StatelessWidget {
  const ShowFormsReactiveExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    key: const Key('flutter_example'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => const FlutterFormExample(),
                        ),
                      );
                    },
                    child: const Text('Flutter Form example'),
                  ),
                  ElevatedButton(
                    key: const Key('reactive_example'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => const ReactiveFormExample(),
                        ),
                      );
                    },
                    child: const Text('Reactive Form example'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
