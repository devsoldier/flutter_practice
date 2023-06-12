// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meals.g.dart';

@JsonSerializable(genericArgumentFactories: true, includeIfNull: false)
class Meals<T> extends Equatable {
  final List<T?> meals;

  const Meals(this.meals);

  factory Meals.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$MealsFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$MealsToJson<T>(this, toJsonT);

  @override
  String toString() => 'Meals(meals: $meals)';

  @override
  List<Object?> get props => [meals];
}
