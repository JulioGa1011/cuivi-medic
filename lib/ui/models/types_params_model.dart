// To parse this JSON data, do
//
//     final typesParametersModel = typesParametersModelFromJson(jsonString);

import 'dart:convert';

TypesParametersModel typesParametersModelFromJson(String str) =>
    TypesParametersModel.fromJson(json.decode(str));

String typesParametersModelToJson(TypesParametersModel data) =>
    json.encode(data.toJson());

class TypesParametersModel {
  TypesParametersModel({
    this.id,
    this.name,
    this.unitMeasure,
    required this.clinicalParamIndicators,
    this.formattedCreatedAt,
    this.formattedUpdatedAt,
  });

  int? id;
  String? name;
  String? unitMeasure;
  List<ClinicalParamIndicator> clinicalParamIndicators;
  String? formattedCreatedAt;
  String? formattedUpdatedAt;

  factory TypesParametersModel.fromJson(Map<String, dynamic> json) =>
      TypesParametersModel(
        id: json["id"],
        name: json["name"],
        unitMeasure: json["unit_measure"],
        clinicalParamIndicators: List<ClinicalParamIndicator>.from(
            json["clinical_param_indicators"]
                .map((x) => ClinicalParamIndicator.fromJson(x))),
        formattedCreatedAt: json["formatted_created_at"],
        formattedUpdatedAt: json["formatted_updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "unit_measure": unitMeasure,
        "clinical_param_indicators":
            List<dynamic>.from(clinicalParamIndicators.map((x) => x.toJson())),
        "formatted_created_at": formattedCreatedAt,
        "formatted_updated_at": formattedUpdatedAt,
      };
}

class ClinicalParamIndicator {
  ClinicalParamIndicator({
    this.id,
    this.clinicalParamId,
    this.name,
    this.color,
    this.healthyRange,
    this.minimumValue,
    this.maximumValue,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  int? clinicalParamId;
  String? name;
  String? color;
  int? healthyRange;
  String? minimumValue;
  String? maximumValue;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? deletedAt;

  factory ClinicalParamIndicator.fromJson(Map<String, dynamic> json) =>
      ClinicalParamIndicator(
        id: json["id"],
        clinicalParamId: json["clinical_param_id"],
        name: json["name"],
        color: json["color"],
        healthyRange: json["healthy_range"],
        minimumValue: json["minimum_value"],
        maximumValue: json["maximum_value"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clinical_param_id": clinicalParamId,
        "name": name,
        "color": color,
        "healthy_range": healthyRange,
        "minimum_value": minimumValue,
        "maximum_value": maximumValue,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
