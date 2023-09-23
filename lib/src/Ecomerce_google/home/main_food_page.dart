import 'package:componentes/src/Ecomerce_google/home/food_page_body.dart';
import 'package:componentes/src/Ecomerce_google/utils/colors.dart';
import 'package:componentes/src/Ecomerce_google/widgets/big_text.dart';
import 'package:componentes/src/Ecomerce_google/widgets/icon_text_wdget.dart';
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
    final double screenHeight = MediaQuery.of(context).size.width;
    final double screenWidth = MediaQuery.of(context).size.height;
    final double height45 = screenHeight / 18.76;
    final double height30 = screenHeight / 28.13;
    final double iconSize24 = screenHeight / 35.17;
    final double width30 = screenHeight / 28.13;

    final double width10 = screenHeight / 84.4;
    final double width20 = screenHeight / 82.2;
    final double radius20 = screenHeight / 42.2;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // top header  information
            Container(
              margin: const EdgeInsets.only(top: 45, bottom: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
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
                    width: height45,
                    height: height45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor,
                    ),
                    child: Icon(Icons.search,
                        color: Colors.white, size: iconSize24),
                  ),
                ],
              ),
            ),

            //  seccion del food body
            const FoodPageBody(),

            SizedBox(height: height30),
            // popular text
            Container(
              margin: EdgeInsets.only(left: width30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BigTexts(
                    text: "Popular",
                  ),
                  SizedBox(width: width10),
                  Container(
                      margin: const EdgeInsets.only(bottom: 3),
                      child: BigTexts(text: ".")),
                  SizedBox(width: width10),
                  Container(
                      margin: const EdgeInsets.only(left: 2),
                      child: SmallText(text: "Food pairing")),
                ],
              ),
            ),

            // List of food and images

            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true, // si ahilito aqui se ajusta solo el listview.
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: width20, right: width20, bottom: width20),
                  child: Row(
                    children: [
                      // picture seccion
                      Container(
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius20),
                            color: Colors.white38,
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/ecomerce_app_fonts/pictures/3.jpg"))),
                      ),
                      // txt Seccion
                      Expanded(
                        child: Container(
                          height: 100,
                          //width: 200,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // horzontal axis line
                              mainAxisAlignment: MainAxisAlignment
                                  .center, //vertical  axis line
                              children: [
                                BigTexts(text: "Nutricion facts in china"),
                                const SizedBox(height: 3),
                                SmallText(text: "form china to taiwan"),
                                const SizedBox(height: 1),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconTextWidget(
                                        iconData: Icons.circle_sharp,
                                        text: "Normal",
                                        iconColor: AppColors.iconColor1),
                                    IconTextWidget(
                                        iconData: Icons.location_on,
                                        text: "1.7 km",
                                        iconColor: AppColors.mainColor),
                                    IconTextWidget(
                                        iconData: Icons.access_time_rounded,
                                        text: "23 min",
                                        iconColor: AppColors.iconColor2),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
