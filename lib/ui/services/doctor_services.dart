import 'package:cuivi_medic/main.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/dio_configuration.dart';

class DoctorServices {
  DoctorServices();
  Future<Response> personalInformationDoctor(context) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response = await dio.get(
        'medic/personal-data',
        // queryParameters: {'columns': '["name","phone"]',}
      );
      logger.d(response);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<Response> professionalInformationDoctor(context) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response = await dio.get(
        'medic/professional-data',
        // queryParameters: {'columns': '["name","phone"]',}
      );
      return response;
    } on DioError {
      rethrow;
    }
  }

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

  Future<Response> editPersonalInformation(
    context,
    name,
    phone,
    officePhone,
    aboutMe,
    photo,
    email,
  ) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response = await dio.post('medic/personal-data', data: {
        "name": name,
        "phone": phone,
        "health_staff": {"office_phone": officePhone, "about_me": aboutMe},
        "profile_photo_url": photo
      }
          // queryParameters: {'columns': '["name","phone"]',}
          );
      return response;
    } on DioError {
      rethrow;
    }
  }
}
