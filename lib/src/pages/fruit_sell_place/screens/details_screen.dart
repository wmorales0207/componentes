import 'dart:math';

import 'package:componentes/src/pages/fruit_sell_place/data/data.dart';
import 'package:componentes/src/pages/fruit_sell_place/utils/utils.dart';
import 'package:componentes/src/pages/fruit_sell_place/widgets/nutrients_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    var itemCount = 1;
    return Scaffold(
      body: Stack(
        children: [
          // product Image

          Container(
            height: size.height * 0.50,
            width: size.width,
            padding: const EdgeInsets.all(20.0),
            color: widget.product.color,
            child: Transform.rotate(
              angle: 2.10 * pi,
              child: Image.asset(
                widget.product.image,
              ),
            ),
          ),
          // top buttons

          Positioned(
            top: 50,
            right: 20,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: iconWidget(FontAwesomeIcons.arrowLeft, false),
                ),
                const Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: iconWidget(FontAwesomeIcons.bagShopping, true),
                ),
              ],
            ),
          ),

          Container(
            width: size.width,
            margin: EdgeInsets.only(top: size.height * 0.55),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: size.height * 0.55,
                child: Column(
                  // product details
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 35,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            priceWidget(widget.product.price),
                          ],
                        ),
                        Container(
                          width: 130,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: boxShadow,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // decrease Cuantity
                              quantityIcon(
                                  ontap: () {},
                                  color: Colors.primaries.first,
                                  iconData: FontAwesomeIcons.minus),

                              // quantity count
                              Text(
                                itemCount.toString(),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              // increase Cuantity
                              quantityIcon(
                                  ontap: () {},
                                  color: Colors.primaries.first,
                                  iconData: FontAwesomeIcons.plus),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Nutrients Details

                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // el aspect ratio modifica el tama;o de lo que se ve en funcion de la proporcion 1 de alto por 6 veces de ancho
                        childAspectRatio: 1.5,
                      ),
                      itemCount: 4,
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (BuildContext context, int index) {
                        return NutrientsWidget(
                            product: data[0].products![index], index: index);
                      },
                    ),
                    // Product Description

                    const Padding(padding: EdgeInsets.all(8.0)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget quantityIcon(
      {required VoidCallback ontap,
      required Color color,
      required IconData iconData}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(
          iconData,
          color: color == Colors.primaries.first
              ? Colors.white
              : Colors.primaries.first,
          size: 20.0,
        ),
      ),
    );
  }
}
