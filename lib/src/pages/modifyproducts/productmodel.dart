import 'dart:convert';

class Product {
  Product({
    required this.disponible,
    required this.name,
    this.picture,
    required this.price,
  });

  bool disponible;
  String name;
  String? picture;
  String? id;

  int price;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        disponible: json["disponible"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "disponible": disponible,
        "name": name,
        "picture": picture,
        "price": price,
      };
}
