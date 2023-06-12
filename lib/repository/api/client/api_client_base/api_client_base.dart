// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter_practice/utilities/constant.dart';

import '../dio_config.dart';

abstract class ApiClientBase {
  Future<Response> request(
    RequestMethod method,
    String path, {
    Map<String, dynamic>? body,
    required BaseURL baseUrl,
  });
}
