// To parse this JSON data, do
//
//     final medicamentModel = medicamentModelFromJson(jsonString);

import 'dart:convert';

MedicamentModel medicamentModelFromJson(String str) =>
    MedicamentModel.fromJson(json.decode(str));

String medicamentModelToJson(MedicamentModel data) =>
    json.encode(data.toJson());

class MedicamentModel {
  MedicamentModel({
    // this.id,
    // this.medicalRecordId,
    required this.name,
    // this.personalDescription,
    // this.firstHour,
    this.days,
    this.hours,
    // this.deletedAt,
    // this.createdAt,
    // this.updatedAt,
    required this.tradename,
    this.administrationFormId,
    this.medicamentPresentationId,
    // this.genericName,
    this.quantity,
    this.grammage,
    // this.startedAt,
    // this.endedAt,
    // this.deleted,
  });

  // int? id;
  // int? medicalRecordId;
  String name;
  // String? personalDescription;
  // String? firstHour;
  String? days;
  String? hours;
  // dynamic deletedAt;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  String tradename;
  int? administrationFormId;
  int? medicamentPresentationId;
  // String? genericName;
  int? quantity;
  int? grammage;
  // dynamic startedAt;
  // dynamic endedAt;
  // bool? deleted;

  factory MedicamentModel.fromJson(Map<String, dynamic> json) =>
      MedicamentModel(
        // id: json["id"],
        // medicalRecordId: json["medical_record_id"],
        name: json["name"],
        // personalDescription: json["personal_description"],
        // firstHour: json["first_hour"],
        days: json["days"],
        hours: json["hours"],
        // deletedAt: json["deleted_at"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        tradename: json["tradename"],
        administrationFormId: json["administration_form_id"],
        medicamentPresentationId: json["medicament_presentation_id"],
        // genericName: json["generic_name"],
        quantity: json["quantity"],
        grammage: json["grammage"],
        // startedAt: json["started_at"],
        // endedAt: json["ended_at"],
        // deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        // "medical_record_id": medicalRecordId,
        "name": name,
        // "personal_description": personalDescription,
        // "first_hour": firstHour,
        "days": days,
        "hours": hours,
        // "deleted_at": deletedAt,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
        "tradename": tradename,
        "administration_form_id": administrationFormId,
        "medicament_presentation_id": medicamentPresentationId,
        // "generic_name": genericName,
        "quantity": quantity,
        "grammage": grammage,
        // "started_at": startedAt,
        // "ended_at": endedAt,
        // "deleted": deleted,
      };
}
