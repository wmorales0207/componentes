import 'package:componentes/src/Ecomerce_google/utils/colors.dart';
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
          Container(
            margin: EdgeInsets.only(top: 45, bottom: 15),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Country"),
                    Text("City"),
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
        ],
      ),
    );
  }
}
