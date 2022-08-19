// To parse this JSON data, do
//
//     final patientModel = patientModelFromJson(jsonString);

import 'dart:convert';

PatientModel patientModelFromJson(String str) =>
    PatientModel.fromJson(json.decode(str));

String patientModelToJson(PatientModel data) => json.encode(data.toJson());

class PatientModel {
  PatientModel({
    this.name,
    this.phone,
    this.id,
    this.patientId,
    this.formattedCreatedAt,
    this.formattedUpdatedAt,
  });

  String? name;
  String? phone;
  int? id;
  int? patientId;
  String? formattedCreatedAt;
  String? formattedUpdatedAt;

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        name: json["name"],
        phone: json["phone"],
        id: json["id"],
        patientId: json["patient_id"],
        formattedCreatedAt: json["formatted_created_at"],
        formattedUpdatedAt: json["formatted_updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "id": id,
        "patient_id": patientId,
        "formatted_created_at": formattedCreatedAt,
        "formatted_updated_at": formattedUpdatedAt,
      };
}
