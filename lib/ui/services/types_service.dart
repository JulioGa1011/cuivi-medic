import 'package:cuivi_medic/main.dart';
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

  Future<Response> specialitiesTypes(context) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response =
          await dio.get('medical-specialities', queryParameters: {
        'columns': '["id","name"]',
      });
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<Response> servicesTypes(context) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response = await dio.get('medical-services', queryParameters: {
        'columns': '["id","name"]',
      });
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<Response> ailmentsTypes(context) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response =
          await dio.get('medical-diagnostics', queryParameters: {
        'columns': '["id","name"]',
      });
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<Response> presentationTypes(context) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response =
          await dio.get('administration-forms', queryParameters: {
        'columns': '["name"]',
      });
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<Response> AdministrationTypes(context) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response =
          await dio.get('/medicament-presentations', queryParameters: {
        'columns': '["id","name"]',
      });
      return response;
    } on DioError {
      rethrow;
    }
  }
}
