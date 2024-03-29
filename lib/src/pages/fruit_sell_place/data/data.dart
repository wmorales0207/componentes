import 'package:flutter/material.dart';

class Category {
  final String name;
  final List<Product>? products;

  const Category({required this.name, this.products});
}

class  Product {
  final String name;
  final String image;
  final String price;
  final bool isSelected;
  final Color color;
  final Color nutrientColor;
  final List<List<String>> nutrients;

  const Product({
    required this.name,
    required this.image,
    required this.isSelected,
    required this.price,
    required this.color,
    required this.nutrientColor,
    required this.nutrients,
  });
}

final data = [
  Category(name: " Fruit", products: [
    Product(
        name: "banana",
        color: Colors.yellow.shade500,
        image: "assets/fruitsData/banana.jpg",
        isSelected: false,
        nutrientColor: Colors.yellow.shade200,
        nutrients: [
          ["Energi", "3"],
          ["Fressness", "3"],
          ["Vitamin", "2"],
          ["Calories", "3"]
        ],
        price: '23.89'),
    Product(
        name: "graves",
        color: Colors.blue.shade500,
        image: 'assets/fruitsData/graves.jpg',
        isSelected: true,
        nutrientColor: Colors.yellow.shade200,
        nutrients: [
          ["Energi", "3"],
          ["Fressness", "3"],
          ["Vitamin", "2"],
          ["Calories", "3"]
        ],
        price: '99.89'),
    Product(
        name: "guayaba",
        color: Colors.red.shade500,
        image: 'assets/fruitsData/guayaba.jpg',
        isSelected: true,
        nutrientColor: Colors.black26,
        nutrients: [
          ["Energi", "3"],
          ["Fressness", "5"],
          ["Vitamin", "7"],
          ["Calories", "22"]
        ],
        price: '77.89'),
    Product(
        name: "orange",
        color: Colors.orange.shade500,
        image: 'assets/fruitsData/orange.jpg',
        isSelected: true,
        nutrientColor: Colors.orange.shade200,
        nutrients: [
          ["Energi", "3"],
          ["Fressness", "3"],
          ["Vitamin", "2"],
          ["Calories", "3"]
        ],
        price: '21.89'),
  ]),
  const Category(name: "vegtables"),
  const Category(name: "fruits"),
  const Category(name: "Meats"),
];
