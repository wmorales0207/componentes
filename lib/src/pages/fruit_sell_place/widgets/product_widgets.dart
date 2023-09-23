import 'dart:math';

import 'package:componentes/src/pages/fruit_sell_place/data/data.dart';
import 'package:componentes/src/pages/fruit_sell_place/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductWigets extends StatelessWidget {
  final Product product;
  const ProductWigets({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      color: product.color,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Transform.rotate(
              angle: 2.05 * pi,
              child: Image.asset(
                product.image,
                height: 80,
              ),
            ),
          ),

          // heart Icon

          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: boxShadow,
              ),
              child: Icon(
                FontAwesomeIcons.solidHeart,
                color:
                    product.isSelected ? Colors.primaries.first : Colors.grey,
                size: 15,
              ),
            ),
          ),

          // product Details

          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              height: 100,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const SizedBox(height: 5.0),
                    priceWidget(product.price),
                    const SizedBox(height: 15.0),
                    Row(
                      children: [
                        const Text("See more"),
                        const SizedBox(width: 10.0),
                        Icon(FontAwesomeIcons.arrowTrendUp,
                            color: Colors.red.shade300, size: 18.0),
                      ],
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
