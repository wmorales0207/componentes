import 'dart:ui';

import 'package:flutter/material.dart';

class GlassEfect extends StatelessWidget {
  const GlassEfect({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: 250,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.black45,
          ),
          child: const Text("data"),
        ),
      ),
    );
  }
}
