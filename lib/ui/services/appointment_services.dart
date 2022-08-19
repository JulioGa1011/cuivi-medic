import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/dio_configuration.dart';

class AppointmentServices {
  AppointmentServices();

  Future<Response> getAppointments(context) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    var dio = DioConfiguration(context).createDio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    try {
      Response response = await dio.get(
        'medic/appointments',
        // queryParameters: {'columns': '["name","phone"]',}
      );
      return response;
    } on DioError {
      rethrow;
    }
  }
}