part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  const CategoryState();

  CategoryLoadedState copyWith({
    Result<Meals<MealsCategory>>? mealsCategory,
    Result<Meals<MealsCategoryDetails>>? mealsCategoryDetails,
  }) {
    return CategoryLoadedState(
      mealsCategory: mealsCategory,
      mealsCategoryDetails: mealsCategoryDetails,
    );
  }

  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final Result<Meals<MealsCategory>>? mealsCategory;
  final Result<Meals<MealsCategoryDetails>>? mealsCategoryDetails;

  const CategoryLoadedState({this.mealsCategory, this.mealsCategoryDetails});

  @override
  List<Object?> get props => [mealsCategory, mealsCategoryDetails];
}

class CategoryLoadingState extends CategoryState {}

class CategoryErrorState extends CategoryState {
  final String? errorMessage;

  const CategoryErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
