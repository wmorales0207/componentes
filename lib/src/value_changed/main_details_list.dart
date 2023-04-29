import 'package:componentes/src/value_changed/detail_screen.dart';
import 'package:componentes/src/value_changed/list_screen.dart';
import 'package:flutter/material.dart';

class MaindetailsScreen extends StatefulWidget {
  const MaindetailsScreen({super.key});
  static const route = "MaindetailsScreen";

  @override
  State<MaindetailsScreen> createState() => _MaindetailsScreenState();
}

class _MaindetailsScreenState extends State<MaindetailsScreen> {
  var valueSelected = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Row(
      children: [
        //OrientationBuilder(builder: builder)
        Expanded(
            // el widget recibe una callback por paramtros,
            child: ListScreen(
          onItemSelected: (value) {
            setState(() {
              valueSelected = value;
            });
          },
        )),
        Expanded(
            flex: 2,
            child: DetailScreem(
              text: valueSelected,
            ))
      ],
    )));
  }
}
