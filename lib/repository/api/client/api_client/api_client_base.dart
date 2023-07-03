import 'package:dio/dio.dart';

import 'package:flutter_practice/utilities/constant.dart';

import '../dio_config.dart';

///Allows customisation to dio package
abstract class ApiClientBase {
  Future<Response> request(
    RequestMethod method,
    String path, {
    Map<String, dynamic>? body,
    required BaseURL baseUrl,
  });
}
