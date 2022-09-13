import 'package:cuivi_medic/main.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/dio_configuration.dart';

class ParamsServices {
  Future<Response> paramTypes(context) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response = await dio.get('clinical-params', queryParameters: {
        'columns': '["id", "name", "unit_measure","clinical_param_indicators"]',
      });
      logger.d(response);

      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<Response> paramsPatient(context, paramId) async {
    logger.d(paramId);
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response = await dio.get('medic/patients/clinical-records',
          queryParameters: {
            'columns': '["value", "clinical_param_id"]',
            'patient_id': paramId
          });
      logger.d(response);
      return response;
    } on DioError {
      rethrow;
    }
  }
}
