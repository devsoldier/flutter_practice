// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'details_bloc.dart';

@immutable
abstract class DetailsState extends Equatable {
  const DetailsState();

  DetailsLoadedState copyWith({
    Result<Meals<MealDetails>>? mealDetails,
    List<String>? ingredients,
    List<String>? measures,
  }) {
    return DetailsLoadedState(
      mealDetails: mealDetails,
      ingredients: ingredients,
      measures: measures,
    );
  }

  @override
  List<Object?> get props => [];
}

class DetailsInitial extends DetailsState {}

class DetailsLoadedState extends DetailsState {
  final Result<Meals<MealDetails>>? mealDetails;
  final List<String>? ingredients;
  final List<String>? measures;

  const DetailsLoadedState({
    this.mealDetails,
    this.ingredients,
    this.measures,
  });

  @override
  List<Object?> get props => [mealDetails, ingredients, measures];
}

class DetailsLoadingState extends DetailsState {}

class DetailsErrorState extends DetailsState {
  final String? errorMessage;

  const DetailsErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
