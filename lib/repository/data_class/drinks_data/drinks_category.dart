import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drinks_category.g.dart';

@JsonSerializable()
class DrinksCategory extends Equatable {
  final String? strCategory;

  DrinksCategory(this.strCategory);

  factory DrinksCategory.fromJson(Map<String, dynamic> json) =>
      _$DrinksCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DrinksCategoryToJson(this);

  @override
  List<Object?> get props => [strCategory];
}

@JsonSerializable()
class DrinksCategoryDetails extends Equatable {
  final String? strDrink;
  final String? strDrinkThumb;
  final String? idDrink;

  DrinksCategoryDetails(this.strDrink, this.strDrinkThumb, this.idDrink);

  factory DrinksCategoryDetails.fromJson(Map<String, dynamic> json) =>
      _$DrinksCategoryDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DrinksCategoryDetailsToJson(this);

  @override
  List<Object?> get props => [strDrink, strDrinkThumb, idDrink];
}
