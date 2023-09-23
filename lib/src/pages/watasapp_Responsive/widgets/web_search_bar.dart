import 'package:componentes/src/pages/watasapp_Responsive/colors.dart';
import 'package:flutter/material.dart';

class WebSearchbar extends StatelessWidget {
  const WebSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.40,
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: dividerColor,
        ))),
        child: TextField(
          decoration: InputDecoration(
            // filled: true,
            fillColor: searchBarColor,
            prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.search, size: 20)),
            hintText: "Search ",
            hintStyle: const TextStyle(fontSize: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            ),
            contentPadding: const EdgeInsets.all(10.0),
          ),
        ));
  }
}
