import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Avatar Page1"),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.all(2.0),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/darling.jpg'),
              radius: 28.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
              backgroundColor: Colors.black54,
              child: Text('JL'),
            ),
          ),
        ],
      ),
      body: const Center(
        child: FadeInImage(
          //image: NetworkImage('uri'),
          image: AssetImage('assets/download.gif'),
          placeholder: AssetImage('assets/download.gif'),
        ),
      ),
    );
  }
}
