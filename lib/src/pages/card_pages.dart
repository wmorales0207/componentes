import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Page3'),
      ),
      body: ListView(
        children: <Widget>[_cardTipo1()],
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: <Widget>[
          const ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('aca esta la tarjeta'),
            subtitle: Text('this is the subtitle'),
          ),
          Row(
            children: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () {},
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ],
      ),
    );
  }
}
