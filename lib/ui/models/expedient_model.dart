import 'dart:convert';

class PatientExpedientModel {
  PatientExpedientModel({
    this.id,
    this.patientId,
    this.hasSocialSecurity,
    this.socialSecurityNumber,
    this.hasAllergies,
    this.hasMedicines,
    this.bloodTypeId,
    this.hasMedicalDiagnostic,
    this.hasMajorMedicalExpenseNumber,
    this.majorMedicalExpenseNumber,
    this.familyDoctorNumber,
    this.familyDoctorName,
    this.emergencyContactNumber,
    this.emergencyContactName,
    this.socialSecurityId,
    this.majorMedicalExpenseId,
    this.createdAt,
    this.updatedAt,
    required this.medicaments,
    required this.allergies,
    required this.medicines,
    required this.medicalRecordMedicaments,
    required this.medicalDiagnostics,
  });

  int? id;
  int? patientId;
  bool? hasSocialSecurity;
  String? socialSecurityNumber;
  bool? hasAllergies;
  bool? hasMedicines;
  int? bloodTypeId;
  bool? hasMedicalDiagnostic;
  bool? hasMajorMedicalExpenseNumber;
  String? majorMedicalExpenseNumber;
  String? familyDoctorNumber;
  String? familyDoctorName;
  String? emergencyContactNumber;
  String? emergencyContactName;
  int? socialSecurityId;
  int? majorMedicalExpenseId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Medicamedicament> medicaments;
  List<Allergy> allergies;
  List<dynamic> medicines;
  List<Medicamedicament> medicalRecordMedicaments;
  List<MedicalDiagnostic> medicalDiagnostics;

  factory PatientExpedientModel.fromJson(Map<String, dynamic> json) =>
      PatientExpedientModel(
        id: json["id"],
        patientId: json["patient_id"],
        hasSocialSecurity: json["has_social_security"],
        socialSecurityNumber: json["social_security_number"] ?? '',
        hasAllergies: json["has_allergies"],
        hasMedicines: json["has_medicines"],
        bloodTypeId: json["blood_type_id"] ?? 1,
        hasMedicalDiagnostic: json["has_medical_diagnostic"],
        hasMajorMedicalExpenseNumber: json["has_major_medical_expense_number"],
        majorMedicalExpenseNumber: json["major_medical_expense_number"] ?? '',
        familyDoctorNumber: json["family_doctor_number"] ?? '',
        familyDoctorName: json["family_doctor_name"] ?? '',
        emergencyContactNumber: json["emergency_contact_number"] ?? '',
        emergencyContactName: json["emergency_contact_name"] ?? '',
        socialSecurityId: json["social_security_id"],
        majorMedicalExpenseId: json["major_medical_expense_id"] ?? 1,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        medicaments: List<Medicamedicament>.from(
            json["medicaments"].map((x) => Medicamedicament.fromJson(x))),
        allergies: List<Allergy>.from(
            json["allergies"].map((x) => Allergy.fromJson(x))),
        medicines: List<dynamic>.from(json["medicines"].map((x) => x)),
        medicalRecordMedicaments: List<Medicamedicament>.from(
            json["medical_record_medicaments"]
                .map((x) => Medicamedicament.fromJson(x))),
        medicalDiagnostics: List<MedicalDiagnostic>.from(
            json["medical_diagnostics"]
                .map((x) => MedicalDiagnostic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patient_id": patientId,
        "has_social_security": hasSocialSecurity,
        "social_security_number": socialSecurityNumber,
        "has_allergies": hasAllergies,
        "has_medicines": hasMedicines,
        "blood_type_id": bloodTypeId,
        "has_medical_diagnostic": hasMedicalDiagnostic,
        "has_major_medical_expense_number": hasMajorMedicalExpenseNumber,
        "major_medical_expense_number": majorMedicalExpenseNumber,
        "family_doctor_number": familyDoctorNumber,
        "family_doctor_name": familyDoctorName,
        "emergency_contact_number": emergencyContactNumber,
        "emergency_contact_name": emergencyContactName,
        "social_security_id": socialSecurityId,
        "major_medical_expense_id": majorMedicalExpenseId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "medicaments": List<dynamic>.from(medicaments.map((x) => x.toJson())),
        "allergies": List<dynamic>.from(allergies.map((x) => x.toJson())),
        "medicines": List<dynamic>.from(medicines.map((x) => x)),
        "medical_record_medicaments":
            List<dynamic>.from(medicalRecordMedicaments.map((x) => x.toJson())),
        "medical_diagnostics":
            List<dynamic>.from(medicalDiagnostics.map((x) => x.toJson())),
      };
}

class Allergy {
  Allergy({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.pivot,
  });

  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? deletedAt;
  AllergyPivot? pivot;

  factory Allergy.fromJson(Map<String, dynamic> json) => Allergy(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        pivot: AllergyPivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "pivot": pivot?.toJson(),
      };
}

class AllergyPivot {
  AllergyPivot({
    this.medicalRecordId,
    this.allergyId,
  });

  int? medicalRecordId;
  int? allergyId;

  factory AllergyPivot.fromJson(Map<String, dynamic> json) => AllergyPivot(
        medicalRecordId: json["medical_record_id"],
        allergyId: json["allergy_id"],
      );

  Map<String, dynamic> toJson() => {
        "medical_record_id": medicalRecordId,
        "allergy_id": allergyId,
      };
}

class MedicalDiagnostic {
  MedicalDiagnostic({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.diagnosedAt,
    this.pivot,
  });

  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? deletedAt;
  String? diagnosedAt;
  MedicalDiagnosticPivot? pivot;

  factory MedicalDiagnostic.fromJson(Map<String, dynamic> json) =>
      MedicalDiagnostic(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"] ?? DateTime.now()),
        updatedAt: DateTime.parse(json["updated_at"] ?? DateTime.now()),
        deletedAt: json["deleted_at"],
        diagnosedAt: json["diagnosed_at"],
        pivot: MedicalDiagnosticPivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "diagnosed_at": diagnosedAt,
        "pivot": pivot?.toJson(),
      };
}

class MedicalDiagnosticPivot {
  MedicalDiagnosticPivot({
    this.medicalRecordId,
    this.medicalDiagnosticId,
    this.diagnosedAt,
  });

  int? medicalRecordId;
  int? medicalDiagnosticId;
  DateTime? diagnosedAt;

  factory MedicalDiagnosticPivot.fromJson(Map<String, dynamic> json) =>
      MedicalDiagnosticPivot(
        medicalRecordId: json["medical_record_id"],
        medicalDiagnosticId: json["medical_diagnostic_id"],
        diagnosedAt: DateTime.parse(json["diagnosed_at"]),
      );

  Map<String, dynamic> toJson() => {
        "medical_record_id": medicalRecordId,
        "medical_diagnostic_id": medicalDiagnosticId,
        "diagnosed_at": diagnosedAt,
      };
}

class Medicamedicament {
  Medicamedicament({
    this.id,
    this.medicalRecordId,
    this.name,
    this.personalDescription,
    this.firstHour,
    this.days,
    this.hours,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.tradename,
    this.administrationFormId,
    this.medicamentPresentationId,
    this.genericName,
    this.quantity,
    this.grammage,
    this.startedAt,
    this.endedAt,
    this.deleted,
  });

  int? id;
  int? medicalRecordId;
  String? name;
  String? personalDescription;
  String? firstHour;
  String? days;
  String? hours;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic tradename;
  dynamic administrationFormId;
  dynamic medicamentPresentationId;
  String? genericName;
  dynamic quantity;
  dynamic grammage;
  dynamic startedAt;
  dynamic endedAt;
  bool? deleted;

  factory Medicamedicament.fromJson(Map<String, dynamic> json) =>
      Medicamedicament(
        id: json["id"],
        medicalRecordId: json["medical_record_id"],
        name: json["name"],
        personalDescription: json["personal_description"],
        firstHour: json["first_hour"],
        days: json["days"],
        hours: json["hours"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        tradename: json["tradename"],
        administrationFormId: json["administration_form_id"],
        medicamentPresentationId: json["medicament_presentation_id"],
        genericName: json["generic_name"],
        quantity: json["quantity"],
        grammage: json["grammage"],
        startedAt: json["started_at"],
        endedAt: json["ended_at"],
        deleted: json["deleted"] == null ? null : json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "medical_record_id": medicalRecordId,
        "name": name,
        "personal_description": personalDescription,
        "first_hour": firstHour,
        "days": days,
        "hours": hours,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "tradename": tradename,
        "administration_form_id": administrationFormId,
        "medicament_presentation_id": medicamentPresentationId,
        "generic_name": genericName,
        "quantity": quantity,
        "grammage": grammage,
        "started_at": startedAt,
        "ended_at": endedAt,
        "deleted": deleted == null ? null : deleted,
      };
}
