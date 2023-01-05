import 'package:cuivi_medic/ui/models/medical_notes_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../../utils/dio_configuration.dart';

class NotesServices {
  NotesServices();

  Future<Response> editProfessionalInformationDoctor(
    context,
    nameDiagnostic,
    nameSpeciality,
    nameMedical,
    location,
    latitude,
    longitude,
    insturance,
    description,
    cedula,
  ) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response = await dio.post('medic/professional-data', data: {
        "medical_diagnostics": [
          {"id": null, "name": nameDiagnostic}
        ],
        "specialities": [
          {"id": null, "name": nameSpeciality}
        ],
        "medical_services": [
          {"id": null, "name": nameMedical}
        ],
        "address": {
          "location": location,
          "latitude": latitude,
          "longitude": longitude
        },
        "attend_patient_with_insurance": insturance
      }
          // queryParameters: {'columns': '["name","phone"]',}
          );
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<Response> createNote(
    context,
    patientId,
    id,
    name,
    age,
    gender,
    recordp,
    recordH,
    recordPp,
    currentCondition,
    interrogator,
    vitalSign,
    physicalExploration,
    results,
    terapeutic,
    diagnostic,
    type,
  ) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response = await dio.post('medic/appointments', data: {
        "patient_id": patientId,
        "data": {"datos": "Aqui van todos los datos de la nota"},
        "type": "Historic clinica"
      }
          // queryParameters: {'columns': '["name","phone"]',}
          );
      return response;
    } on DioError {
      rethrow;
    }
  }
}
