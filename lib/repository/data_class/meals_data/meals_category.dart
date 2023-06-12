// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meals_category.g.dart';

@JsonSerializable()
class MealsCategory extends Equatable {
  final String? strCategory;

  const MealsCategory({this.strCategory});

  factory MealsCategory.fromJson(Map<String, dynamic> json) =>
      _$MealsCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$MealsCategoryToJson(this);

  @override
  List<Object?> get props => [strCategory];

  @override
  bool get stringify => true;
}

@JsonSerializable()
class MealsCategoryDetails extends Equatable {
  final String? strMeal;
  final String? strMealThumb;
  final String? idMeal;

  const MealsCategoryDetails({this.strMeal, this.strMealThumb, this.idMeal});

  factory MealsCategoryDetails.fromJson(Map<String, dynamic> json) =>
      _$MealsCategoryDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MealsCategoryDetailsToJson(this);

  @override
  List<Object?> get props => [strMeal, strMealThumb, idMeal];
}
