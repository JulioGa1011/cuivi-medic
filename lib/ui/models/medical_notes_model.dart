// To parse this JSON data, do
//
//     final medicalNotes = medicalNotesFromJson(jsonString);

import 'dart:convert';

import 'package:cuivi_medic/ui/models/vital_sign_model.dart';

MedicalNotes medicalNotesFromJson(String str) =>
    MedicalNotes.fromJson(json.decode(str));

String medicalNotesToJson(MedicalNotes data) => json.encode(data.toJson());

class MedicalNotes {
  MedicalNotes({
    required this.patientId,
    required this.data,
    required this.type,
  });

  int patientId;
  Data data;
  String type;

  factory MedicalNotes.fromJson(Map<String, dynamic> json) => MedicalNotes(
        patientId: json["patient_id"],
        data: Data.fromJson(json["data"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "patient_id": patientId,
        "data": data.toJson(),
        "type": type,
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.age,
    this.gender,
    this.interrogation,
    this.physicalExploration,
    this.results,
    this.diagnostic,
    this.treatment,
    this.pronostic,
    this.nameDoctor,
    this.identificationCard,
    this.signature,
    this.vitalSing,
  });

  int? id;
  String? name;
  int? age;
  String? gender;
  // String? recordH;
  // String? recordP;
  // String? recordPp;
  // String? currentCondition;
  String? interrogation;
  String? physicalExploration;
  String? results;
  // String? therapeutic;
  String? diagnostic;
  String? treatment;
  String? pronostic;
  String? nameDoctor;
  String? identificationCard;
  String? signature;
  List<VitalSign>? vitalSing;
  // String? free;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        interrogation: json["interrogation"],
        physicalExploration: json["physical_exploration"],
        results: json["results"],
        diagnostic: json["diagnostic"],
        treatment: json["treatment"],
        pronostic: json["pronostic"],
        nameDoctor: json["name_doctor"],
        identificationCard: json["identification_card"],
        signature: json["signature"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "gender": gender,
        "interrogation": interrogation,
        "physical_exploration": physicalExploration,
        "results": results,
        "diagnostic": diagnostic,
        "treatment": treatment,
        "pronostic": pronostic,
        "name_doctor": nameDoctor,
        "identification_card": identificationCard,
        "signature": signature,
      };
}
