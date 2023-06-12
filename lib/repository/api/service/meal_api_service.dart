import 'dart:convert';
import 'dart:developer';
import 'package:flutter_practice/repository/api/client/api_client_base.dart';
import 'package:flutter_practice/repository/api/client/dio_config.dart';
import 'package:flutter_practice/repository/api/service/service_base/service_base.dart';
import 'package:flutter_practice/repository/data_class/meals_data/meal_details.dart';
import 'package:flutter_practice/repository/data_class/meals_data/meals.dart';
import 'package:flutter_practice/repository/data_class/meals_data/meals_category.dart';
import 'package:flutter_practice/utilities/result.dart';

class MealApiService extends ApiClientBase implements ServiceBase<Result> {
  MealApiService._privateConstructor();

  static final MealApiService _instance = MealApiService._privateConstructor();

  static MealApiService get instance => _instance;

  final mealUrl = BaseURL.meal;

  @override
  Future<Result<Meals<MealsCategory>>> getCategories() async {
    try {
      final response = await request(
        RequestMethod.get,
        '/list.php?c=list',
        baseUrl: mealUrl,
      );
      final dataParsed = Meals<MealsCategory>.fromJson(
        (response.data as Map<String, dynamic>),
        (json) => MealsCategory.fromJson(json as Map<String, dynamic>),
      );
      return Result.success(dataParsed);
    } catch (e, s) {
      return Result.failure('$e\n$s');
    }
  }

  @override
  Future<Result<Meals<MealsCategoryDetails>>> getCategoryDetails(
      String? category) async {
    try {
      final response = await request(
        RequestMethod.get,
        '/filter.php?c=$category',
        baseUrl: mealUrl,
      );
      final dataParsed = Meals<MealsCategoryDetails>.fromJson(
        (response.data as Map<String, dynamic>),
        (json) => MealsCategoryDetails.fromJson(json as Map<String, dynamic>),
      );
      log('parsing2 ${dataParsed.meals[0]!.strMeal}');
      return Result.success(dataParsed);
    } catch (e, s) {
      return Result.failure('$e\n$s');
    }
  }

  @override
  Future<Result<Meals<MealDetails>>> getDetails(int? mealID) async {
    try {
      final response = await request(
        RequestMethod.get,
        '/lookup.php?i=$mealID',
        baseUrl: mealUrl,
      );
      final dataParsed = Meals<MealDetails>.fromJson(
        (response.data as Map<String, dynamic>),
        (json) => MealDetails.fromJson(json as Map<String, dynamic>),
      );
      log('parsing2 ${dataParsed.meals[0]!.strMeal}');
      return Result.success(dataParsed);
    } catch (e, s) {
      return Result.failure('$e\n$s');
    }
  }
}
