import 'dart:convert';

Medicines medicinesFromJson(String str) => Medicines.fromJson(json.decode(str));

String medicinesToJson(Medicines data) => json.encode(data.toJson());

class Medicines {
  Medicines({
    required this.id,
    required this.name,
    required this.namePresentation,
    required this.presentation,
    required this.quantity,
    required this.frequency,
    required this.duration,
  });

  int id;
  int presentation;
  int quantity;
  String name;
  String namePresentation;
  String frequency;
  String duration;

  factory Medicines.fromJson(Map<String, dynamic> json) => Medicines(
        id: json["id"],
        presentation: json["presentation"],
        quantity: json["quantity"],
        name: json["name"],
        namePresentation: json["name_presentation"],
        frequency: json["frequency"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "presentation": presentation,
        "quantity": quantity,
        "frequency": frequency,
        "duration": duration,
      };
}
