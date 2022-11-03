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
      "client_secret": "e1mUTviUulN6rdkSR3sWdDrx04nACNVHMYn9ARyM",
      "username": email,
      "password": password,
    };

    try {
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

  Future<Response> registerUser({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    var data = {
      "email": email,
      "name": name,
      "password": password,
      'password_confirmation': passwordConfirmation,
      'client_secret': dotenv.env['clientSecret'],
      'client_id': dotenv.env['clientId'],
      'scope': '*',
      'grant_type': 'password',
    };
    Response response;
    try {
      response = await dio.post(
        "register/medic",
        options: Options(headers: {"requirestoken": false}),
        data: data,
      );
      return response;
    } on DioError {
      rethrow;
    }
  }
}
