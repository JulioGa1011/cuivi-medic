import 'dart:convert';

StoreModel storeModelFromJson(String str) =>
    StoreModel.fromJson(json.decode(str));

String storeModelToJson(StoreModel data) => json.encode(data.toJson());

class StoreModel {
  StoreModel({
    this.id,
    this.available,
    this.stock,
    this.name,
    this.photo,
    this.price,
    this.shortDescription,
    this.formattedCreatedAt,
    this.formattedUpdatedAt,
  });

  int? id;
  int? available;
  int? stock;
  String? name;
  String? photo;
  int? price;
  String? shortDescription;
  String? formattedCreatedAt;
  String? formattedUpdatedAt;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json["id"],
        available: json["available"],
        stock: json["stock"],
        name: json["name"],
        photo: json["photo"],
        price: json["price"],
        shortDescription: json["short_description"],
        formattedCreatedAt: json["formatted_created_at"],
        formattedUpdatedAt: json["formatted_updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "available": available,
        "stock": stock,
        "name": name,
        "photo": photo,
        "price": price,
        "short_description": shortDescription,
        "formatted_created_at": formattedCreatedAt,
        "formatted_updated_at": formattedUpdatedAt,
      };
}
