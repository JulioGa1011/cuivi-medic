import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../../utils/dio_configuration.dart';
import '../models/medicament_prescription_model.dart';

class MedicinesServices {
  Future<Response> substanceService(context) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response = await dio.get('medic/medicines', queryParameters: {
        'columns': '["id", "name", "substances","medicine_presentations"]',
      });

      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<Response> createPrescriptions(
      {required int idPatient,
      required String name,
      required String email,
      required double weight,
      required String allergies,
      required String age,
      required String ta,
      required String fc,
      required String fr,
      required String glucose,
      required String temperature,
      required String diagnosis,
      required List<Medicines> medicines,
      context}) async {
    var dio = DioConfiguration(context).createDio();

    var data = {
      "patient_id": idPatient,
      "name": name,
      "email": email,
      "weight": weight,
      "allergies": allergies,
      "age": age,
      "ta": ta,
      "fc": fc,
      "fr": fr,
      "glucose": glucose,
      "temperature": temperature,
      "diagnosis": diagnosis,
      "medicines": medicines
    };
    Response response;
    try {
      response = await dio.post(
        "medic/prescriptions",
        options: Options(headers: {"requirestoken": false}),
        data: data,
      );
      logger.d(response);
      return response;
    } on DioError {
      rethrow;
    }
  }
}