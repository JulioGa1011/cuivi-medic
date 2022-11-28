import 'package:cuivi_medic/main.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/dio_configuration.dart';

class PatientServices {
  Future<Response> getPatients(context) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response = await dio.get('medic/patients', queryParameters: {
        'columns': '["name","phone", "profile_photo_url"]',
      });
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<Response> patientInformation(context, patientId) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response =
          await dio.get('medic/patients/$patientId', queryParameters: {
        'columns':
            '["id","name","email","phone","photo","profile_photo_url","formatted_created_at","formatted_updated_at", "patient_id"]',
      });
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<Response> getMedicalInformatioPatiens(context, patientId) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response = await dio
          .get('medic/patients/medical-records/show', queryParameters: {
        'patient_id': patientId,
      });
      return response;
    } on DioError {
      rethrow;
    }
  }
}
