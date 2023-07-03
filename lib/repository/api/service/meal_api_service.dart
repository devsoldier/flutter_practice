// ignore: unused_import
import 'dart:developer';

import 'package:flutter_practice/repository/api/client/dio_config.dart';
import 'package:flutter_practice/repository/api/service/api_service/api_service.dart';
import 'package:flutter_practice/repository/api/service/api_service/service_base.dart';
import 'package:flutter_practice/repository/data_class/meals_data/meal_details.dart';
import 'package:flutter_practice/repository/data_class/meals_data/meals.dart';
import 'package:flutter_practice/repository/data_class/meals_data/meals_category.dart';
import 'package:flutter_practice/utilities/constant.dart';
import 'package:flutter_practice/utilities/result.dart';

class MealApiService implements ServiceBase<Result> {
  // final ApiClientBase apiClient;
  final ApiService apiService;

  MealApiService({
    required this.apiService,
  });

  final mealUrl = BaseURL.meal;

  @override
  Future<Result<Meals<MealsCategory>>> getCategories() async {
    try {
      final response = await apiService.makeRequest(
        method: RequestMethod.get,
        path: '/list.php?c=list',
        baseUrl: mealUrl,
        fromJson: (json) => Meals<MealsCategory>.fromJson(
          json,
          (json) => MealsCategory.fromJson(json as Map<String, dynamic>),
        ),
      );
      if (response.isSuccess) {
        return response;
      } else if (response.isFailure) {
        throw Exception(response.message);
      } else {
        throw Exception('something went wrong');
      }
    } catch (e, s) {
      return Result.failure('$e\n$s');
    }
  }

  @override
  Future<Result<Meals<MealsCategoryDetails>>> getCategoryDetails(
      String? category) async {
    try {
      final response = await apiService.makeRequest(
        method: RequestMethod.get,
        path: '/filter.php?c=$category',
        baseUrl: mealUrl,
        fromJson: (json) => Meals<MealsCategoryDetails>.fromJson(
          json,
          (json) => MealsCategoryDetails.fromJson(json as Map<String, dynamic>),
        ),
      );
      if (response.isSuccess) {
        return response;
      } else if (response.isFailure) {
        throw Exception(response.message);
      } else {
        throw Exception('something went wrong');
      }
    } catch (e, s) {
      return Result.failure('$e\n$s');
    }
  }

  @override
  Future<Result<Meals<MealDetails>>> getDetails(int? mealID) async {
    try {
      final response = await apiService.makeRequest(
        method: RequestMethod.get,
        path: '/lookup.php?i=$mealID',
        baseUrl: mealUrl,
        fromJson: (json) => Meals<MealDetails>.fromJson(
          json,
          (json) => MealDetails.fromJson(json as Map<String, dynamic>),
        ),
      );
      if (response.isSuccess) {
        return response;
      } else if (response.isFailure) {
        throw Exception(response.message);
      } else {
        throw Exception('something went wrong');
      }
    } catch (e, s) {
      return Result.failure('$e\n$s');
    }
  }
}
