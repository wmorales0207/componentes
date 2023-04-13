import 'dart:convert';

import 'package:componentes/src/pages/peliculas_app/models/models.dart';

class CreditsResponse {
  int id;

  List<Cast> cast;

  List<Cast> crew;

  CreditsResponse({required this.id, required this.cast, required this.crew});

  factory CreditsResponse.fromJson(String str) =>
      CreditsResponse.fromMap(json.decode(str));

  factory CreditsResponse.fromMap(Map<String, dynamic> json) => CreditsResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
      );
}
