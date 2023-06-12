// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meals<T> _$MealsFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Meals<T>(
      (json['meals'] as List<dynamic>)
          .map((e) => _$nullableGenericFromJson(e, fromJsonT))
          .toList(),
    );

Map<String, dynamic> _$MealsToJson<T>(
  Meals<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'meals': instance.meals
          .map((e) => _$nullableGenericToJson(e, toJsonT))
          .toList(),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
