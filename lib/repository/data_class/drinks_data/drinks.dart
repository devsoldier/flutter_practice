import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drinks.g.dart';

@JsonSerializable(genericArgumentFactories: true, includeIfNull: false)
class Drinks<T> extends Equatable {
  final List<T?> drinks;

  Drinks(this.drinks);

  factory Drinks.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$DrinksFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$DrinksToJson<T>(this, toJsonT);

  @override
  List<Object?> get props => [drinks];
}
