import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveWidget(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 768) {
          return mobile;
        } else {
          return tablet;
        }

        //return Container();
      },
    );
  }
}
