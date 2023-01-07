class VitalSign {
  VitalSign({
    this.value,
    this.clinicalParamId,
    this.date,
  });

  String? value;
  int? clinicalParamId;
  String? date;

  factory VitalSign.fromJson(Map<String, dynamic> json) => VitalSign(
        value: json["value"],
        clinicalParamId: json["clinical_param_id"],
        date: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "clinical_param_id": clinicalParamId,
        "id": date,
      };
}
