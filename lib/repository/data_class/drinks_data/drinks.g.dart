// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drinks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drinks<T> _$DrinksFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Drinks<T>(
      (json['drinks'] as List<dynamic>)
          .map((e) => _$nullableGenericFromJson(e, fromJsonT))
          .toList(),
    );

Map<String, dynamic> _$DrinksToJson<T>(
  Drinks<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'drinks': instance.drinks
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
