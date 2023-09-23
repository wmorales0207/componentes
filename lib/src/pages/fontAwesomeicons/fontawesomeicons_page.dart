import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FontAwesomeIconsPage extends StatefulWidget {
  const FontAwesomeIconsPage({super.key});

  @override
  State<FontAwesomeIconsPage> createState() => _FontAwesomeIconsPageState();
}

class _FontAwesomeIconsPageState extends State<FontAwesomeIconsPage> {
  String _selectedCategory = 'bussiness';

  String get selectedCategory => _selectedCategory;

  set selectedCategory(value) => _selectedCategory = value;

  List<Category> categoryLit = [
    Category(icondata: FontAwesomeIcons.building, name: 'bussiness'),
    Category(icondata: FontAwesomeIcons.addressCard, name: 'address'),
    Category(icondata: FontAwesomeIcons.plane, name: 'planes1'),
    Category(icondata: FontAwesomeIcons.poop, name: 'poop3'),
    Category(icondata: FontAwesomeIcons.addressCard, name: 'address9'),
    Category(icondata: FontAwesomeIcons.plane, name: 'planes'),
    Category(icondata: FontAwesomeIcons.addressCard, name: 'addressj'),
    Category(icondata: FontAwesomeIcons.plane, name: 'planesg'),
    Category(icondata: FontAwesomeIcons.poop, name: 'poop'),
    Category(icondata: FontAwesomeIcons.addressCard, name: 'addresss'),
    Category(icondata: FontAwesomeIcons.kitMedical, name: 'medicald'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categoryLit.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  selectedCategory = categoryLit[index].name;
                  setState(() {});
                },
                child: Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Icon(
                    categoryLit[index].icondata,
                    color: selectedCategory == categoryLit[index].name
                        ? Colors.black
                        : Colors.red,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                categoryLit[index].name,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Category {
  final IconData icondata;
  final String name;
  Category({required this.icondata, required this.name});
}
