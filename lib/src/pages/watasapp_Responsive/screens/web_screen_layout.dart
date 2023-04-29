import 'package:componentes/src/pages/responsive_layout/widgets/contacts_list.dart';
import 'package:flutter/material.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            // web profile bar
            //web search
            ContactList(),
          ],
          // webScreen
        )
      ],
    ));
  }
}
