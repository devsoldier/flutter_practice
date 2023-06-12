// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drinks_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinksCategory _$DrinksCategoryFromJson(Map<String, dynamic> json) =>
    DrinksCategory(
      json['strCategory'] as String?,
    );

Map<String, dynamic> _$DrinksCategoryToJson(DrinksCategory instance) =>
    <String, dynamic>{
      'strCategory': instance.strCategory,
    };

DrinksCategoryDetails _$DrinksCategoryDetailsFromJson(
        Map<String, dynamic> json) =>
    DrinksCategoryDetails(
      json['strDrink'] as String?,
      json['strDrinkThumb'] as String?,
      json['idDrink'] as String?,
    );

Map<String, dynamic> _$DrinksCategoryDetailsToJson(
        DrinksCategoryDetails instance) =>
    <String, dynamic>{
      'strDrink': instance.strDrink,
      'strDrinkThumb': instance.strDrinkThumb,
      'idDrink': instance.idDrink,
    };
