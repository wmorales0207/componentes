import 'package:flutter/material.dart';

class AspectRatioAlignPage extends StatelessWidget {
  static const route = 'aspectRatioalign';
  const AspectRatioAlignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              const Text('Showing Aspect Ratio -Align- Expanded Combination ')),
      body: SafeArea(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              // el expanded use all the space.
              // an expanded an aspect radio togueder , the aspect ratio does not work
              // you must use an align and then the aspect ratio will b respeted by the expanded
              // the text is affected by the expanded y is positioned in the botton .

              child: Align(
                alignment: Alignment.topCenter,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.purple.shade400,
                    child: Image.asset('assets/darling.jpg'),
                  ),
                ),
              ),
            ),
            const Text('botoon text'),
            SizedBox(
              height: 30,
            ),
            const Text('botoon text'),
          ],
        ),
      ),
    );
  }
}
