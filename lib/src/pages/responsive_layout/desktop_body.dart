import 'package:flutter/material.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('M O B I L E')),
      backgroundColor: Colors.deepPurple[400],
      body: Column(
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
          
          RawMaterialButton(onPressed: () {
            
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.star),
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
    );
  }
}
