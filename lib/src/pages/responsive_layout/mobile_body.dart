import 'package:flutter/material.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('M OV I L E')),
      backgroundColor: Colors.deepPurple[400],
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    // aspect ratio keep the proportion all time
                    aspectRatio: 16 / 9,
                    child: Container(
                      height: 200,
                      color: Colors.deepPurple[200],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 8, // create a list view with 8 items
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 120,
                          color: Colors.deepPurple[100],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }
}
