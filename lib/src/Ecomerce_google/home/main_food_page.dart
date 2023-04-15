import 'package:componentes/src/Ecomerce_google/home/food_page_body.dart';
import 'package:componentes/src/Ecomerce_google/utils/colors.dart';
import 'package:componentes/src/Ecomerce_google/widgets/big_text.dart';
import 'package:componentes/src/Ecomerce_google/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MainFoddPage extends StatefulWidget {
  static const route = "MainFoddPage";
  const MainFoddPage({super.key});

  @override
  State<MainFoddPage> createState() => _MainFoddPage();
}

class _MainFoddPage extends State<MainFoddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // top container ifoemation
          Container(
            margin: EdgeInsets.only(top: 45, bottom: 15),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigTexts(text: "Bangladesh", color: AppColors.mainColor),
                    Row(
                      children: [
                        SmallText(text: "City", color: Colors.black54),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.mainColor,
                  ),
                  child: const Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
          ),
          //  seccion del food body
          FoodPageBody(),
        ],
      ),
    );
  }
}
