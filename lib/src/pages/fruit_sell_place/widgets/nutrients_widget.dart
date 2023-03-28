import 'package:componentes/src/pages/fruit_sell_place/data/data.dart';
import 'package:componentes/src/pages/fruit_sell_place/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NutrientsWidget extends StatefulWidget {
  final Product product;
  final int index;
  const NutrientsWidget(
      {super.key, required this.product, required this.index});

  @override
  State<NutrientsWidget> createState() => _NutrientsWidgetState();
}

class _NutrientsWidgetState extends State<NutrientsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: boxShadow,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.product.nutrients[widget.index][0],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${widget.product.nutrients[widget.index][1]}/5",
                style: TextStyle(
                  color: widget.product.nutrientColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),

          //  Building the indicators

          Row(
            children: buildIndicators(widget.product.nutrients[widget.index][0],
                int.parse(widget.product.nutrients[widget.index][1])),
          ),
        ],
      ),
    );
  }

  List<Widget> buildIndicators(String nutrientType, int value) {
    List<Widget> listWidgets = [];
    for (var i = 0; i < 5; i++) {
      listWidgets.add(i < value
          ? indicator(true, nutrientType)
          : indicator(false, nutrientType));
    }
    return listWidgets;
  }

  Widget indicator(bool isActive, String nutrientType) {
    IconData? iconData;
    switch (nutrientType) {
      case "Energi":
        iconData = FontAwesomeIcons.bold;
        break;

      case "Fressness":
        iconData = FontAwesomeIcons.glassWater;
        break;
      case "Vitamin":
        iconData = Icons.rocket_launch_rounded;
        break;
      case "Calories":
        iconData = FontAwesomeIcons.fire;
        break;

      default:
    }
    return Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 5.0),
      child: Icon(
        iconData,
        color: isActive ? widget.product.nutrientColor : Colors.black,
        size: 16,
      ),
    );
  }
}
