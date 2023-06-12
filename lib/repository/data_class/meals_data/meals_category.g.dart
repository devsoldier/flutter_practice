// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsCategory _$MealsCategoryFromJson(Map<String, dynamic> json) =>
    MealsCategory(
      strCategory: json['strCategory'] as String?,
    );

Map<String, dynamic> _$MealsCategoryToJson(MealsCategory instance) =>
    <String, dynamic>{
      'strCategory': instance.strCategory,
    };

MealsCategoryDetails _$MealsCategoryDetailsFromJson(
        Map<String, dynamic> json) =>
    MealsCategoryDetails(
      strMeal: json['strMeal'] as String?,
      strMealThumb: json['strMealThumb'] as String?,
      idMeal: json['idMeal'] as String?,
    );

Map<String, dynamic> _$MealsCategoryDetailsToJson(
        MealsCategoryDetails instance) =>
    <String, dynamic>{
      'strMeal': instance.strMeal,
      'strMealThumb': instance.strMealThumb,
      'idMeal': instance.idMeal,
    };
