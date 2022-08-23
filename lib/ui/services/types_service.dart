import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/dio_configuration.dart';

class TypesServices {
  Future<Response> bloodTypes(context) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response = await dio.get('blood-types', queryParameters: {
        'columns': '["id","name"]',
      });
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<Response> expensiveTypes(context) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response =
          await dio.get('major-medical-expenses', queryParameters: {
        'columns': '["id","name"]',
      });
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<Response> soialSegurityTypes(context) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response = await dio.get('social-securities', queryParameters: {
        'columns': '["id","name"]',
      });
      return response;
    } on DioError {
      rethrow;
    }
  }
}
