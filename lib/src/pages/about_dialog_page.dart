import 'package:flutter/material.dart';

//// This widget muestra toda la info de tu App,ya qu eel componente
///AboutDialog trae por defecto info de tu App
class AboutDialogPage extends StatelessWidget {
  const AboutDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: _getAboutDialog(),
          );
        },
        child: const Text('Show About Dialog1'),
      ),
    );
  }

  _getAboutDialog() {
    return const AboutDialog(
      applicationIcon: FlutterLogo(),
      applicationName: 'Fluter App Componentes',
      applicationVersion: 'version 1.0.0',
      children: [
        Text('This a text created by Will'),
      ],
    );
  }
}
