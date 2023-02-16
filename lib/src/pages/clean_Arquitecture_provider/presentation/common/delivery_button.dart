import 'package:flutter/material.dart';

class DeliberyButton extends StatelessWidget {
   DeliberyButton({
    super.key,
    required this.onTap,
    required this.text,
     this.padding = const EdgeInsets.all(14),
  });

  final VoidCallback onTap;
  final String text;
   EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: Colors.primaries),
        ),
        child: Padding(padding: padding),
      ),
    );
  }
}
