import 'package:componentes/src/pages/watasapp_Responsive/colors.dart';
import 'package:componentes/src/pages/watasapp_Responsive/responsive/responsive_layout.dart';
import 'package:componentes/src/pages/watasapp_Responsive/screens/movile_screen_layout.dart';
import 'package:componentes/src/pages/watasapp_Responsive/screens/web_screen_layout.dart';
import 'package:flutter/material.dart';

class WhatsAppMain extends StatelessWidget {
  const WhatsAppMain({super.key});
  static const route = "WhatsAppMain";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: ResponsiveLayout(
          movileScreenLayout: MovileScreenLayout(),
          webScreenLayout: WebScreenLayout()),
    );
  }
}
