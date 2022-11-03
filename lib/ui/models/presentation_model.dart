// To parse this JSON data, do
//
//     final typesModel = typesModelFromJson(jsonString);

import 'dart:convert';

PresentationModel typesModelFromJson(String str) =>
    PresentationModel.fromJson(json.decode(str));

String typesModelToJson(PresentationModel data) => json.encode(data.toJson());

class PresentationModel {
  PresentationModel({
    required this.id,
    required this.name,
    this.formattedCreatedAt,
    this.formattedUpdatedAt,
  });

  int id;
  String name;
  dynamic formattedCreatedAt;
  dynamic formattedUpdatedAt;

  factory PresentationModel.fromJson(Map<String, dynamic> json) =>
      PresentationModel(
        id: json["id"],
        name: json["name"],
        formattedCreatedAt: json["formatted_created_at"],
        formattedUpdatedAt: json["formatted_updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "formatted_created_at": formattedCreatedAt,
        "formatted_updated_at": formattedUpdatedAt,
      };
}
