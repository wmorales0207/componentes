import 'package:componentes/src/pages/responsive_layout/desktop_body.dart';
import 'package:componentes/src/pages/responsive_layout/mobile_body.dart';
import 'package:componentes/src/pages/responsive_layout/responsive_layout.dart';
import 'package:flutter/material.dart';

class Initlayout extends StatelessWidget {
  const Initlayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayutPage(
        desktopBody: DesktopBody(),
        mobileBody: MobileBody(),
      ),
    );
  }
}
