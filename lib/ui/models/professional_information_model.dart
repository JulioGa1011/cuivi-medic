import 'dart:convert';

ProfessionalInformartion professionalInformartionFromJson(String str) =>
    ProfessionalInformartion.fromJson(json.decode(str));

String professionalInformartionToJson(ProfessionalInformartion data) =>
    json.encode(data.toJson());

class ProfessionalInformartion {
  ProfessionalInformartion({
    this.id,
    this.userId,
    this.officePhone,
    this.attendPatientWithInsurance,
    this.aboutMe,
    this.identificationCard,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.address,
    required this.medicalServices,
    required this.medicalDiagnostics,
    required this.specialities,
  });

  int? id;
  int? userId;
  String? officePhone;
  int? attendPatientWithInsurance;
  String? aboutMe;
  String? identificationCard;
  dynamic createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  Address address;
  List<dynamic> medicalServices;
  List<dynamic> medicalDiagnostics;
  List<dynamic> specialities;

  factory ProfessionalInformartion.fromJson(Map<String, dynamic> json) =>
      ProfessionalInformartion(
        id: json["id"],
        userId: json["user_id"],
        officePhone: json["office_phone"],
        attendPatientWithInsurance: json["attend_patient_with_insurance"],
        aboutMe: json["about_me"],
        identificationCard: json["identification_card"],
        createdAt: json["created_at"],
        updatedAt:
            DateTime.parse(json["updated_at"] ?? DateTime.now().toString()),
        deletedAt: json["deleted_at"],
        address: Address.fromJson(json["address"]),
        medicalServices:
            List<dynamic>.from(json["medical_services"].map((x) => x)),
        medicalDiagnostics:
            List<dynamic>.from(json["medical_diagnostics"].map((x) => x)),
        specialities: List<dynamic>.from(json["specialities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "office_phone": officePhone,
        "attend_patient_with_insurance": attendPatientWithInsurance,
        "about_me": aboutMe,
        "identification_card": identificationCard,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "address": address.toJson(),
        "medical_services": List<dynamic>.from(medicalServices.map((x) => x)),
        "medical_diagnostics":
            List<dynamic>.from(medicalDiagnostics.map((x) => x)),
        "specialities": List<dynamic>.from(specialities.map((x) => x)),
      };
}

class Address {
  Address({
    this.id,
    this.location,
    this.latitude,
    this.longitude,
  });

  int? id;
  dynamic location;
  String? latitude;
  String? longitude;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        location: json["location"],
        latitude: json["latitude"].toString(),
        longitude: json["longitude"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
      };
}
