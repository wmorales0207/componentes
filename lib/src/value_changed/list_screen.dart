import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key, required this.onItemSelected});

/// esta callback esta definida en flutter definidia para cuando un valor cambia, tambien existen otras
  final ValueChanged<String> onItemSelected;
  //ValueSetter<int> onhh;
  //AsyncValueGetter<int> odod;
  //AsyncValueSetter<double> jdhksjdha;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () => onItemSelected("Item == $index"),
          title: Text("Item $index"),
        );
      },
    );
  }
}
