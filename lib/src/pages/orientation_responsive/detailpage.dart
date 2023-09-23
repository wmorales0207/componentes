import 'package:componentes/src/pages/orientation_responsive/detail_widget.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final int data;
  const DetailPage(this.data, {super.key});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DetailWidget(widget.data),
    );
  }
}
