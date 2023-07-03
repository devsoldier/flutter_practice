import 'package:flutter_practice/repository/api/client/api_client/api_client_base.dart';
import 'package:flutter_practice/repository/api/client/dio_config.dart';
import 'package:flutter_practice/repository/api/service/api_service/api_service.dart';
import 'package:flutter_practice/utilities/constant.dart';
import 'package:flutter_practice/utilities/result.dart';

class DefaultApiService<T> implements ApiService<T> {
  final ApiClientBase apiClient;

  DefaultApiService(this.apiClient);

  @override
  Future<Result<T>> makeRequest<T>({
    required RequestMethod method,
    required String path,
    required BaseURL baseUrl,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await apiClient.request(method, path, baseUrl: baseUrl);
      final dataParsed = fromJson(response.data as Map<String, dynamic>);
      return Result.success(dataParsed);
    } catch (e, s) {
      return Result.failure('$e\n$s');
    }
  }
}
