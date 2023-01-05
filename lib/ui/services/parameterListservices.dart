import 'package:cuivi_medic/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/dio_configuration.dart';

class ParametersListService {
  Future<Response> getParameter(context) async {
    Dio dio = DioConfiguration(context).createDio();
    try {
      final response = await dio.get(
        'clinical-params?columns=["id", "name", "unit_measure", "minimum_value", "maximum_value"]',
        options: Options(
          headers: {'requiresToken': true},
        ),
      );
      logger.d(response);
      return response;
    } on DioError {
      rethrow;
    }
  }
}
