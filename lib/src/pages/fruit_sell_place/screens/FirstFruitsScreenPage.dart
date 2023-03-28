import 'package:componentes/src/pages/fruit_sell_place/data/data.dart';
import 'package:componentes/src/pages/fruit_sell_place/screens/details_screen.dart';
import 'package:componentes/src/pages/fruit_sell_place/utils/utils.dart';
import 'package:componentes/src/pages/fruit_sell_place/widgets/product_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirstFruitsScreenPage extends StatefulWidget {
  const FirstFruitsScreenPage({super.key});

  @override
  State<FirstFruitsScreenPage> createState() => _FirstFruitsScreenPageState();
}

class _FirstFruitsScreenPageState extends State<FirstFruitsScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            children: [
              //top cpntainer

              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey.shade300,

                    // backgroundImage:
                    //     const AssetImage("assets/fruitsData/banana.jpg"),
                    child: const Icon(FontAwesomeIcons.userDoctor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Wilmedus Morales zayys",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  //iconWidget(FontAwesomeIcons.bagShopping, true),
                ],
              ),

              const SizedBox(
                height: 5.0,
              ),
              // tagline...
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Get your  fresh items \n",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: "with ",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: "hay market\n",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.60,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: boxShadow,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 25.0,
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Search PineApple",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.primaries.first, shape: BoxShape.circle),
                    child: const Icon(
                      FontAwesomeIcons.filter,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              // Category List
              SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 20.0),
                  itemBuilder: (context, index)
                      // for internal padding  of text
                      {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        data[index].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              index == 0 ? FontWeight.bold : FontWeight.w300,
                          color: index == 0
                              ? Colors.primaries.first
                              : Colors.black45,
                        ),
                      ),
                    );
                  },
                ),
              ),

              //Product Grid View
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 40),
                itemCount: data[0].products!.length,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                product: data[0].products![index]))),
                    child: ProductWigets(product: data[0].products![index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
