import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NeumorphicButton extends StatefulWidget {
  static const route = 'NeumorphicButton';

  NeumorphicButton({super.key});

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  final backgroundColor = const Color(0xffe7ecef);

  bool ispressed = true;

  @override
  Widget build(BuildContext context) {
    var blur = ispressed ? 5.0 : 30.0;
    final isdarkmode = const Color(0xff2e3239);

    var distance = ispressed ? const Offset(10, 10) : const Offset(28, 28);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {});
            ispressed = !ispressed;
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    blurRadius:
                        blur, // give son degradado to the shadow if bigger number bigger degradado
                    offset: distance,
                    inset: ispressed,
                    color: Color(0xfaa7a9af)), //give a shadow botton -right

                BoxShadow(
                    blurRadius:
                        blur, // give son degradado to the shadow if bigger number bigger degradado
                    inset: ispressed,
                    offset: -distance, // the oposite position of shadows
                    color: Colors.white), //give a shadow botton -right
              ],
            ),
            child: const SizedBox(
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
