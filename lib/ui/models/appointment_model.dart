import 'dart:convert';

AppointmentModel appointmentModelFromJson(String str) =>
    AppointmentModel.fromJson(json.decode(str));

String appointmentModelToJson(AppointmentModel data) =>
    json.encode(data.toJson());

class AppointmentModel {
  AppointmentModel({
    required this.appointmentTime,
    required this.start,
    required this.end,
    required this.title,
    required this.description,
    required this.id,
    required this.formattedCreatedAt,
    required this.formattedUpdatedAt,
  });

  DateTime appointmentTime;
  String start;
  String end;
  String title;
  String description;
  int id;
  String formattedCreatedAt;
  String formattedUpdatedAt;

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
        appointmentTime: DateTime.parse(json["appointment_time"]),
        start: json["start"],
        end: json["end"],
        title: json["title"],
        description: json["description"] ?? "",
        id: json["id"],
        formattedCreatedAt: json["formatted_created_at"],
        formattedUpdatedAt: json["formatted_updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "appointment_time":
            "${appointmentTime.year.toString().padLeft(4, '0')}-${appointmentTime.month.toString().padLeft(2, '0')}-${appointmentTime.day.toString().padLeft(2, '0')}",
        "start": start,
        "end": end,
        "title": title,
        "description": description,
        "id": id,
        "formatted_created_at": formattedCreatedAt,
        "formatted_updated_at": formattedUpdatedAt,
      };
}
