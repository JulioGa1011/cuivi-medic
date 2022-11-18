// To parse this JSON data, do
//
//     final medicaments = medicamentsFromJson(jsonString);

import 'dart:convert';

MedicamentsPrescription medicamentsFromJson(String str) =>
    MedicamentsPrescription.fromJson(json.decode(str));

String medicamentsToJson(MedicamentsPrescription data) =>
    json.encode(data.toJson());

class MedicamentsPrescription {
  MedicamentsPrescription({
    this.id,
    this.name,
    this.substances,
    this.medicinePresentations,
    this.formattedCreatedAt,
    this.formattedUpdatedAt,
  });

  int? id;
  String? name;
  List<Substance>? substances;
  List<MedicinePresentation>? medicinePresentations;
  dynamic formattedCreatedAt;
  dynamic formattedUpdatedAt;

  factory MedicamentsPrescription.fromJson(Map<String, dynamic> json) =>
      MedicamentsPrescription(
        id: json["id"],
        name: json["name"],
        substances: List<Substance>.from(
            json["substances"].map((x) => Substance.fromJson(x))),
        medicinePresentations: List<MedicinePresentation>.from(
            json["medicine_presentations"]
                .map((x) => MedicinePresentation.fromJson(x))),
        formattedCreatedAt: json["formatted_created_at"],
        formattedUpdatedAt: json["formatted_updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "substances": List<dynamic>.from(substances!.map((x) => x.toJson())),
        "medicine_presentations":
            List<dynamic>.from(medicinePresentations!.map((x) => x.toJson())),
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
    return other is MedicamentsPrescription &&
        other.id == id &&
        other.name == name;
  }

  @override
  int get hashCode => Object.hash(id, name);
}

class MedicinePresentation {
  MedicinePresentation({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  MedicinePresentationPivot? pivot;

  factory MedicinePresentation.fromJson(Map<String, dynamic> json) =>
      MedicinePresentation(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: MedicinePresentationPivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "pivot": pivot!.toJson(),
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
    return other is MedicamentsPrescription &&
        other.id == id &&
        other.name == name;
  }

  @override
  int get hashCode => Object.hash(id, name);
}

class MedicinePresentationPivot {
  MedicinePresentationPivot({
    this.medicineId,
    this.medicinePresentationId,
  });

  int? medicineId;
  int? medicinePresentationId;

  factory MedicinePresentationPivot.fromJson(Map<String, dynamic> json) =>
      MedicinePresentationPivot(
        medicineId: json["medicine_id"],
        medicinePresentationId: json["medicine_presentation_id"],
      );

  Map<String, dynamic> toJson() => {
        "medicine_id": medicineId,
        "medicine_presentation_id": medicinePresentationId,
      };
}

class Substance {
  Substance({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  SubstancePivot? pivot;

  factory Substance.fromJson(Map<String, dynamic> json) => Substance(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: SubstancePivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "pivot": pivot!.toJson(),
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
    return other is MedicamentsPrescription &&
        other.id == id &&
        other.name == name;
  }

  @override
  int get hashCode => Object.hash(id, name);
}

class SubstancePivot {
  SubstancePivot({
    this.medicineId,
    this.substanceId,
  });

  int? medicineId;
  int? substanceId;

  factory SubstancePivot.fromJson(Map<String, dynamic> json) => SubstancePivot(
        medicineId: json["medicine_id"],
        substanceId: json["substance_id"],
      );

  Map<String, dynamic> toJson() => {
        "medicine_id": medicineId,
        "substance_id": substanceId,
      };
}
