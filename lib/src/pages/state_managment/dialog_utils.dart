import 'package:flutter/material.dart';

void showHelloDialog(BuildContext context, String title) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(title: Text(' hello:  $title'));
      });
}
