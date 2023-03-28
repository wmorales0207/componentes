import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slide_to_act/slide_to_act.dart';

import 'FirstFruitsScreenPage.dart';

class IntroScreen extends StatelessWidget {
  static const route = "Fruits";
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "HAY MARKETS",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.red.shade300,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.1),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "FIRST ONLINE ",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "MARKETS",
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Our Markrt always provide fresh items from the local farmers, let s suport them",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                    color: Colors.black54),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/images.jpg'),
              ),

              FloatingActionButton(
                onPressed: () {
                  Timer(
                    const Duration(milliseconds: 500),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FirstFruitsScreenPage()),
                    ),
                  );
                },
                elevation: 1.0,
                child: const Icon(Icons.slideshow),
              ),
              // const SizedBox(
              //   height: 20.0,
              // ),
              SlideAction(
                outerColor: Colors.primaries.first,
                sliderButtonIcon: Icon(
                  FontAwesomeIcons.arrowRight,
                  size: 20,
                  color: Colors.primaries.first,
                ),
                text: "Swipe",
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                onSubmit: () {
                  Timer(
                    const Duration(milliseconds: 500),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const FirstFruitsScreenPage()),
                      ),
                    ),
                  );
                },
              ),

              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "How to suport ",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: "LOCAL FARMERS ",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.red.shade400,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
