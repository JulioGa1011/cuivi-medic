// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class ParametersModel {
  // ParametersModel({
  //   required this.id,
  //   required this.name,
  //   this.patientId,
  //   this.unitMeasure,
  //   this.date,
  //   this.time,
  // });
  int id;
  String name;
  String? unitMeasure;
  DateTime? date;
  int? patientId;
  String? minimumValue;
  String? maximumValue;
  ParametersModel({
    required this.id,
    required this.name,
    this.unitMeasure,
    this.date,
    this.patientId,
    this.minimumValue,
    this.maximumValue,
  });

  ParametersModel copyWith({
    int? id,
    String? name,
    String? unitMeasure,
    DateTime? date,
    int? patientId,
    String? minimumValue,
    String? maximumValue,
  }) {
    return ParametersModel(
      id: id ?? this.id,
      name: name ?? this.name,
      unitMeasure: unitMeasure ?? this.unitMeasure,
      date: date ?? this.date,
      patientId: patientId ?? this.patientId,
      minimumValue: minimumValue ?? this.minimumValue,
      maximumValue: maximumValue ?? this.maximumValue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'unit_measure': unitMeasure,
      'date': date?.millisecondsSinceEpoch,
      'patientId': patientId,
      'minimumValue': minimumValue,
      'maximumValue': maximumValue,
    };
  }

  factory ParametersModel.fromMap(Map<String, dynamic> map) {
    return ParametersModel(
      id: map['id'] as int,
      name: map['name'] as String,
      unitMeasure:
          map['unit_measure'] != null ? map['unit_measure'] as String : null,
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int)
          : null,
      patientId: map['patientId'] != null ? map['patientId'] as int : null,
      minimumValue:
          map['minimum_value'] != null ? map['minimum_value'] as String : null,
      maximumValue:
          map['maximum_value'] != null ? map['maximum_value'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParametersModel.fromJson(String source) =>
      ParametersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ParametersModel(id: $id, name: $name, unitMeasure: $unitMeasure, date: $date, patientId: $patientId, minimumValue: $minimumValue, maximumValue: $maximumValue)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ParametersModel &&
        other.id == id &&
        other.name == name &&
        other.unitMeasure == unitMeasure &&
        other.date == date &&
        other.patientId == patientId &&
        other.minimumValue == minimumValue &&
        other.maximumValue == maximumValue;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        unitMeasure.hashCode ^
        date.hashCode ^
        patientId.hashCode ^
        minimumValue.hashCode ^
        maximumValue.hashCode;
  }
}
