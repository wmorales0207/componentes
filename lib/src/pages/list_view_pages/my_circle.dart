import 'package:flutter/material.dart';

class MyCircle extends StatelessWidget {
  final String stories;

  const MyCircle({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Container(
        width: 200,
        height: 200,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
        child: Center(
          child: Text(
            stories,
            style: const TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
