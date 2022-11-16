import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../../utils/dio_configuration.dart';

class MedicinesServices {
  Future<Response> substanceService(context) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response = await dio.get('medic/medicines', queryParameters: {
        'columns': '["id", "name"]',
      });

      return response;
    } on DioError {
      rethrow;
    }
  }
}
