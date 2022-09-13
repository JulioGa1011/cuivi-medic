class ParametersModel {
  ParametersModel({
    this.value,
    this.clinicalParamId,
    this.id,
    this.formattedCreatedAt,
    this.formattedUpdatedAt,
  });

  String? value;
  int? clinicalParamId;
  int? id;
  String? formattedCreatedAt;
  String? formattedUpdatedAt;

  factory ParametersModel.fromJson(Map<String, dynamic> json) =>
      ParametersModel(
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
