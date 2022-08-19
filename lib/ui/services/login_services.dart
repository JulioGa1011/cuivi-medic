import 'package:cuivi_medic/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/dio_configuration.dart';

class LoginServices {
  final BuildContext context;

  LoginServices(this.context);
  late Dio dio = DioConfiguration(context).createDio();

  Future<Response> requestLogin(String email, String password) async {
    var prefs = await SharedPreferences.getInstance();

    var data = {
      "grant_type": "password",
      "scope": "*",
      "client_id": dotenv.env['clientId'],
      "client_secret": dotenv.env['clientSecret'],
      "username": email,
      "password": password,
    };

    try {
      logger.d('Hola');
      Response response = await dio.post(
        "login",
        options: Options(headers: {"requirestoken": false}),
        data: data,
      );
      prefs.setString('access_token', response.data['access_token']);
      logger.d(response);

      return response;
    } on DioError {
      logger.d('error');
      rethrow;
    }
  }
}
