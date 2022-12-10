// To parse this JSON data, do
//
//     final medicalNotes = medicalNotesFromJson(jsonString);

import 'dart:convert';

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
    this.recordH,
    this.recordP,
    this.recordPp,
    this.currentCondition,
    this.interrogation,
    this.vitalSigns,
    this.physicalExploration,
    this.results,
    this.therapeutic,
    this.diagnostic,
    this.treatment,
    this.pronostic,
    this.nameDoctor,
    this.identificationCard,
    this.signature,
    this.free,
  });

  int? id;
  String? name;
  int? age;
  String? gender;
  String? recordH;
  String? recordP;
  String? recordPp;
  String? currentCondition;
  String? interrogation;
  List<VitalSign>? vitalSigns;
  String? physicalExploration;
  String? results;
  String? therapeutic;
  String? diagnostic;
  String? treatment;
  String? pronostic;
  String? nameDoctor;
  String? identificationCard;
  String? signature;
  String? free;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        recordH: json["record_h"],
        recordP: json["record_p"],
        recordPp: json["record_pp"],
        currentCondition: json["current_condition"],
        interrogation: json["interrogation"],
        vitalSigns: List<VitalSign>.from(
            json["vital_signs"].map((x) => VitalSign.fromJson(x))),
        physicalExploration: json["physical_exploration"],
        results: json["results"],
        therapeutic: json["therapeutic"],
        diagnostic: json["diagnostic"],
        treatment: json["treatment"],
        pronostic: json["pronostic"],
        nameDoctor: json["name_doctor"],
        identificationCard: json["identification_card"],
        signature: json["signature"],
        free: json["free"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "gender": gender,
        "record_h": recordH,
        "record_p": recordP,
        "record_pp": recordPp,
        "current_condition": currentCondition,
        "interrogation": interrogation,
        "vital_signs": List<dynamic>.from(vitalSigns!.map((x) => x.toJson())),
        "physical_exploration": physicalExploration,
        "results": results,
        "therapeutic": therapeutic,
        "diagnostic": diagnostic,
        "treatment": treatment,
        "pronostic": pronostic,
        "name_doctor": nameDoctor,
        "identification_card": identificationCard,
        "signature": signature,
        "free": free,
      };
}

class VitalSign {
  VitalSign({
    this.value,
    this.clinicalParamId,
    this.id,
    this.formattedCreatedAt,
    this.formattedUpdatedAt,
  });

  int? value;
  int? clinicalParamId;
  int? id;
  String? formattedCreatedAt;
  String? formattedUpdatedAt;

  factory VitalSign.fromJson(Map<String, dynamic> json) => VitalSign(
        value: json["value"],
        clinicalParamId: json["clinical_param_id"],
        id: json["id"],
        formattedCreatedAt: json["formatted_created_at"],
        formattedUpdatedAt: json["formatted_updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "clinical_param_id": clinicalParamId,
        "id": id,
        "formatted_created_at": formattedCreatedAt,
        "formatted_updated_at": formattedUpdatedAt,
      };
}
