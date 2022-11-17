class PersonalInformation {
  PersonalInformation(
      {this.id,
      this.userTypeId,
      this.name,
      this.phone,
      this.email,
      this.emailVerifiedAt,
      this.currentTeamId,
      this.profilePhotoPath,
      this.status,
      // this.createdAt,
      this.updatedAt,
      // this.deletedAt,
      this.profilePhotoUrl,
      required this.healthStaff,
      this.qrCode});

  int? id;
  int? userTypeId;
  String? name;
  String? phone;
  String? email;
  String? emailVerifiedAt;
  int? currentTeamId;
  String? profilePhotoPath;
  int? status;
  // dynamic createdAt;
  String? updatedAt;
  // dynamic deletedAt;
  String? profilePhotoUrl;
  HealthStaff healthStaff;
  String? qrCode;

  factory PersonalInformation.fromJson(Map<String, dynamic> json) =>
      PersonalInformation(
        id: json["id"],
        userTypeId: json["user_type_id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        status: json["status"],
        // createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        // deletedAt: json["deleted_at"],
        profilePhotoUrl: json["profile_photo_url"],
        healthStaff: HealthStaff.fromJson(
          json["health_staff"],
        ),
        qrCode: json["qr_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_type_id": userTypeId,
        "name": name,
        "phone": phone,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "status": status,
        // "created_at": createdAt,
        "updated_at": updatedAt,
        // "deleted_at": deletedAt,
        "profile_photo_url": profilePhotoUrl,
        "health_staff": healthStaff.toJson(),
        "qr_code": qrCode
      };
}

class HealthStaff {
  HealthStaff({
    this.id,
    this.userId,
    this.officePhone,
    this.attendPatientWithInsurance,
    this.aboutMe,
    this.identificationCard,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
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

  factory HealthStaff.fromJson(Map<String, dynamic> json) => HealthStaff(
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
      };
}
