import 'package:flutter/material.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
        leading: const Icon(
          Icons.add_box_rounded,
        ),
      ),
      body: const Center(
        child: Text('Person'),
      ),
    );
  }
}
