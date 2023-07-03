// ignore: unused_import
import 'dart:developer';
import 'package:flutter_practice/repository/api/client/dio_config.dart';
import 'package:flutter_practice/repository/api/service/api_service/api_service.dart';
import 'package:flutter_practice/repository/api/service/api_service/service_base.dart';
import 'package:flutter_practice/repository/data_class/drinks_data/drink_details.dart';
import 'package:flutter_practice/repository/data_class/drinks_data/drinks.dart';
import 'package:flutter_practice/repository/data_class/drinks_data/drinks_category.dart';
import 'package:flutter_practice/utilities/constant.dart';
import 'package:flutter_practice/utilities/result.dart';

class DrinkApiService implements ServiceBase<Result> {
  final ApiService apiService;

  DrinkApiService({
    required this.apiService,
  });

  final drinkURL = BaseURL.meal;

  @override
  Future<Result<Drinks<DrinksCategory>>> getCategories() async {
    try {
      final response = await apiService.makeRequest(
        method: RequestMethod.get,
        path: '/list.php?c=list',
        baseUrl: drinkURL,
        fromJson: (json) => Drinks<DrinksCategory>.fromJson(
          json,
          (json) => DrinksCategory.fromJson(json as Map<String, dynamic>),
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
  Future<Result<Drinks<DrinksCategoryDetails>>> getCategoryDetails(
      String? category) async {
    try {
      final response = await apiService.makeRequest(
        method: RequestMethod.get,
        path: '/filter.php?c=$category',
        baseUrl: drinkURL,
        fromJson: (json) => Drinks<DrinksCategoryDetails>.fromJson(
          json,
          (json) =>
              DrinksCategoryDetails.fromJson(json as Map<String, dynamic>),
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
  Future<Result<Drinks<DrinkDetails>>> getDetails(int? mealID) async {
    try {
      final response = await apiService.makeRequest(
        method: RequestMethod.get,
        path: '/lookup.php?i=$mealID',
        baseUrl: drinkURL,
        fromJson: (json) => Drinks<DrinkDetails>.fromJson(
          json,
          (json) => DrinkDetails.fromJson(json as Map<String, dynamic>),
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
