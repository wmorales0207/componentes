import 'package:componentes/src/pages/home_temp.dart';
import 'package:flutter/material.dart';

// con el sniped mateapp te crea la app completa para iniciar
// siempre veo que inician con un StatelessWidget parece asunto de diseno
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Componentes',
      debugShowCheckedModeBanner: false,
      home:HomePageTemp(),
    );
  }
}
