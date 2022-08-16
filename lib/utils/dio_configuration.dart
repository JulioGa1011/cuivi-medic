import 'dart:io';

import 'package:cuivi_medic/utils/error_dialog.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class DioConfiguration {
  final BuildContext context;

  DioConfiguration(this.context);

  Dio createDio() {
    HttpOverrides.global = MyHttpOverrides();

    return addInterceptors(
      Dio(
        BaseOptions(
          connectTimeout: 50000,
          receiveTimeout: 50000,
          baseUrl: dotenv.env['baseUrlApi']!,
        ),
      ),
    );
  }

  Dio addInterceptors(Dio dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) => requestInterceptor(options, handler),
          onError: (DioError e, handler) => errorInterceptor(e, handler),
        ),
      );
  }

  dynamic requestInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers.containsKey("requiresToken")) {
      options.headers.remove("requiresToken");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String accessToken = prefs.getString("access_token") ?? '';

      options.headers.addAll({"authorization": "Bearer $accessToken"});
    }

    options.headers.addAll({"Content-Type": "application/json"});
    options.headers.addAll({"Accept": "application/json"});
    options.headers.addAll({"X-Requested-With": "XMLHttpRequest"});
    return handler.next(options);
  }

  dynamic errorInterceptor(
    DioError dioError,
    ErrorInterceptorHandler handler,
  ) async {
    if (dioError.response?.data == null) {
      showDialog(
        context: context,
        builder: (context) {
          return const ErrorDialog(
            errorMessage:
                'Compruebe su conexión a internet y vuelva a intentarlo.',
          );
        },
      );
    } else if (dioError.response?.statusCode == 500) {
      showDialog(
        context: context,
        builder: (context) {
          return ErrorDialog(
            errorMessage: dioError.response!.data['message'],
          );
        },
      );
    } else {
      String currentError = '';
      if (dioError.response?.data.toString().contains('errors') == true) {
        var errors = dioError.response?.data['errors'];
        errors.keys.forEach((key) {
          currentError = '${errors[key][0]}\n $currentError';
        });
      } else {
        currentError = dioError.response?.data['message'];
      }
      showDialog(
        context: context,
        builder: (context) {
          return ErrorDialog(
            title: 'Error',
            errorMessage: currentError,
          );
        },
      );
    }
    return handler.next(dioError);
  }
}
