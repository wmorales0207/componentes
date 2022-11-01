import 'package:flutter/material.dart';

class LoadingProducts extends StatelessWidget {
  const LoadingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modfiy Card'),
      ),
      body: CircularProgressIndicator(color: Colors.indigo.shade400),
    );
  }
}
