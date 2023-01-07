import 'dart:convert';

import 'package:cuivi_medic/ui/models/vital_sign_model.dart';

ClinicHistoryModel medicalNotesFromJson(String str) =>
    ClinicHistoryModel.fromJson(json.decode(str));

String medicalNotesToJson(ClinicHistoryModel data) =>
    json.encode(data.toJson());

class ClinicHistoryModel {
  ClinicHistoryModel({
    this.patientId,
    required this.data,
    this.type,
  });

  int? patientId;
  Data data;
  String? type;

  factory ClinicHistoryModel.fromJson(Map<String, dynamic> json) =>
      ClinicHistoryModel(
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
    this.identificationFile,
    this.name,
    this.age,
    this.gender,
    this.recordH,
    this.recordP,
    this.recordPp,
    this.currentCondition,
    this.interrogation,
    this.physicalExploration,
    this.result,
    this.therapeutic,
    this.diagnostic,
    this.vitalSign,
  });

  int? id;
  String? identificationFile;
  String? name;
  int? age;
  String? gender;
  String? recordH;
  String? recordP;
  String? recordPp;
  String? currentCondition;
  String? interrogation;
  String? physicalExploration;
  String? result;
  String? therapeutic;
  String? diagnostic;
  List<VitalSign>? vitalSign;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        identificationFile: json["identification_file"],
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        recordH: json["record_h"],
        recordP: json["record_p"],
        recordPp: json["record_pp"],
        currentCondition: json["current_condition"],
        interrogation: json["interrogation"],
        physicalExploration: json["physical_exploration"],
        result: json["result"],
        therapeutic: json["therapeutic"],
        diagnostic: json["diagnostic"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "identification_file": identificationFile,
        "name": name,
        "age": age,
        "gender": gender,
        "record_h": recordH,
        "record_p": recordP,
        "record_pp": recordPp,
        "current_condition": currentCondition,
        "interrogation": interrogation,
        "physical_exploration": physicalExploration,
        "result": result,
        "therapeutic": therapeutic,
        "diagnostic": diagnostic,
        "vital_sign": vitalSign,
      };
}
