// To parse this JSON data, do
//
//     final typesModel = typesModelFromJson(jsonString);

import 'dart:convert';

TypesModel typesModelFromJson(String str) =>
    TypesModel.fromJson(json.decode(str));

String typesModelToJson(TypesModel data) => json.encode(data.toJson());

class TypesModel {
  TypesModel({
    required this.id,
    required this.name,
    this.formattedCreatedAt,
    this.formattedUpdatedAt,
  });

  int id;
  String name;
  dynamic formattedCreatedAt;
  dynamic formattedUpdatedAt;

  factory TypesModel.fromJson(Map<String, dynamic> json) => TypesModel(
        id: json["id"],
        name: json["name"] ?? "",
        formattedCreatedAt: json["formatted_created_at"],
        formattedUpdatedAt: json["formatted_updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "formatted_created_at": formattedCreatedAt,
        "formatted_updated_at": formattedUpdatedAt,
      };

  @override
  String toString() {
    return '$id, $name';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is TypesModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => Object.hash(id, name);
}
