import 'package:flutter/material.dart';

class ResponsiveLayutPage extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;
  const ResponsiveLayutPage(
      {super.key, required this.mobileBody, required this.desktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // when the maxWidth is less than 600 must be an mobile device
          return mobileBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
