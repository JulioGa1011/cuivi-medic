import 'dart:convert';

import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/utils/dio_configuration.dart';
import 'package:dio/dio.dart';

class StoreServices {
  Future<Response> getProducts(context) async {
    Dio dio = DioConfiguration(context).createDio();
    Map<String, String> data = {
      'columns': json.encode([
        'id',
        'available',
        'stock',
        'name',
        'photo',
        'price',
        'short_description'
      ]),
    };

    try {
      Response response = await dio.get(
        'product-catalogs',
        queryParameters: data,
        options: Options(
          headers: {'requiresToken': true},
        ),
      );
      return response;
    } on DioError {
      rethrow;
    }
  }
}
