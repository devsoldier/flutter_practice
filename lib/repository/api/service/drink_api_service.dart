import 'dart:convert';
import 'dart:developer';
import 'package:flutter_practice/repository/api/client/api_client_base/api_client_base.dart';
import 'package:flutter_practice/repository/api/client/dio_config.dart';
import 'package:flutter_practice/repository/api/service/service_base/service_base.dart';
import 'package:flutter_practice/repository/data_class/drinks_data/drink_details.dart';
import 'package:flutter_practice/repository/data_class/drinks_data/drinks.dart';
import 'package:flutter_practice/repository/data_class/drinks_data/drinks_category.dart';
import 'package:flutter_practice/utilities/constant.dart';
import 'package:flutter_practice/utilities/result.dart';

class DrinkApiService implements ServiceBase<Result> {
  final ApiClientBase apiClient;

  DrinkApiService({
    required this.apiClient,
  });

  final drinkURL = BaseURL.meal;

  @override
  Future<Result<Drinks<DrinksCategory>>> getCategories() async {
    try {
      final response = await apiClient.request(
        RequestMethod.get,
        '/list.php?c=list',
        baseUrl: drinkURL,
      );
      final dataParsed = Drinks<DrinksCategory>.fromJson(
        (response.data as Map<String, dynamic>),
        (json) => DrinksCategory.fromJson(json as Map<String, dynamic>),
      );
      return Result.success(dataParsed);
    } catch (e, s) {
      return Result.failure('$e\n$s');
    }
  }

  @override
  Future<Result<Drinks<DrinksCategoryDetails>>> getCategoryDetails(
      String? category) async {
    try {
      final response = await apiClient.request(
        RequestMethod.get,
        '/filter.php?c=$category',
        baseUrl: drinkURL,
      );
      final dataParsed = Drinks<DrinksCategoryDetails>.fromJson(
        (response.data as Map<String, dynamic>),
        (json) => DrinksCategoryDetails.fromJson(json as Map<String, dynamic>),
      );
      log('parsing2 ${dataParsed.drinks[0]!.strDrink}');
      return Result.success(dataParsed);
    } catch (e, s) {
      return Result.failure('$e\n$s');
    }
  }

  @override
  Future<Result<Drinks<DrinkDetails>>> getDetails(int? drinkID) async {
    try {
      final response = await apiClient.request(
        RequestMethod.get,
        '/lookup.php?i=$drinkID',
        baseUrl: drinkURL,
      );
      final dataParsed = Drinks<DrinkDetails>.fromJson(
        (response.data as Map<String, dynamic>),
        (json) => DrinkDetails.fromJson(json as Map<String, dynamic>),
      );
      log('parsing2 ${dataParsed.drinks[0]!.strDrink}');
      return Result.success(dataParsed);
    } catch (e, s) {
      return Result.failure('$e\n$s');
    }
  }
}
