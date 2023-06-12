// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter_practice/repository/api/client/dio_config.dart';
import 'package:flutter_practice/utilities/constant.dart';

import 'api_client_base/api_client_base.dart';

class DioApiClient extends ApiClientBase {
  final Dio dio;

  DioApiClient(
    this.dio,
  );

  @override
  Future<Response> request(
    RequestMethod method,
    String path, {
    Map<String, dynamic>? body,
    required BaseURL baseUrl,
  }) async {
    try {
      return await dio.request(
        '${baseUrl == BaseURL.meal ? mealURL : drinkURL}$path',
        options: Options(method: method.toValue()),
        data: body,
      );
    } on SocketException {
      throw 'Please check your network connection and try again';
    } catch (e, s) {
      log('$e\n$s');
      rethrow;
    }
  }
}
