import 'package:flutter_practice/repository/api/client/dio_config.dart';
import 'package:flutter_practice/utilities/constant.dart';
import 'package:flutter_practice/utilities/result.dart';

///Allows fake implementations by returning a mock object to Result<T>
abstract class ApiService<T> {
  Future<Result<T>> makeRequest<T>({
    required RequestMethod method,
    required String path,
    required BaseURL baseUrl,
    required T Function(Map<String, dynamic>) fromJson,
  });
}
