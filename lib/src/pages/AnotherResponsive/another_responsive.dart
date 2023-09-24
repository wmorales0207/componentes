import 'package:componentes/src/pages/AnotherResponsive/responsive_helper.dart';
import 'package:flutter/material.dart';

class AnotherResponsive extends StatefulWidget {
  const AnotherResponsive({super.key});

  @override
  State<AnotherResponsive> createState() => _AnotherResponsiveState();
}

class _AnotherResponsiveState extends State<AnotherResponsive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Codex"),
      ),
      body: SafeArea(
        child: ResponsiveWidget(
          mobile: const Column(
            children: <Widget>[
              BuildBanner(),
              BuildText(),
            ],
          ),
          tablet: const Row(
            children: <Widget>[
              BuildBanner(),
              Expanded(child: BuildText()),
            ],
          ),
          desktop: Container(),
        ),
      ),
    );
  }
}

class BuildText extends StatelessWidget {
  const BuildText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
        "Hey there \n\n Codex is an ecosystem of practical resource \nbuild the new world",
        style: TextStyle(fontSize: 22));
  }
}

class BuildBanner extends StatelessWidget {
  const BuildBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 180,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Colors.red, Colors.pink]),
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }
}
