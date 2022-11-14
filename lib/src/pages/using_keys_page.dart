import 'dart:math';

import 'package:flutter/material.dart';

class PositionedTile extends StatefulWidget {
  static const route = 'PositionedTilekeys';
  const PositionedTile({Key? key}) : super(key: key);

  @override
  State<PositionedTile> createState() => _PositionedTileState();
}

class _PositionedTileState extends State<PositionedTile> {
  late List<Widget> tiles;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tiles = [
       StatelessColorfullTile(key: UniqueKey(),),
       StatelessColorfullTile(key: UniqueKey(),),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Try with Keys'),
      ),
      body: Center(
        child: Row(
          children: tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(Icons.key_off_rounded),
      ),
    );
  }

  void swapTiles() {
    setState(() {});
    tiles.insert(
        1,
        tiles.removeAt(
            0)); // put in pos 1 the element of position [0]. nd the elemnt of position 1 becomesthe elemnt of pos[0] and go on
  }
}

class StatelessColorfullTile extends StatelessWidget {
  const StatelessColorfullTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 80,
      color: Color.fromRGBO(Random().nextInt(250), 240, 240, 1),
    );
  }
}
