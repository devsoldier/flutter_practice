import 'dart:developer';

import 'package:flutter_practice/repository/api/service/meal_api_service.dart';
import 'package:flutter_practice/repository/api/service/service_base/service_base.dart';
import 'package:flutter_practice/repository/data_class/meals_data/meals.dart';
import 'package:flutter_practice/repository/data_class/meals_data/meals_category.dart';
import 'package:flutter_practice/utilities/result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final _mealAPI = GetIt.I<MealApiService>();
  Result<Meals<MealsCategory>>? mealsCategory;
  Result<Meals<MealsCategoryDetails>>? mealsCategoryDetails;
  List<String>? categoryThumbnail;

  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      try {
        if (event is CategoryErrorState) {
          emit(const CategoryErrorState('error'));
          return;
        }
        if (event is LoadCategoryData) {
          mealsCategory = await _mealAPI.getCategories();
          mealsCategoryDetails = await _mealAPI.getCategoryDetails(
            event.categoryName ?? mealsCategory!.data!.meals.first!.strCategory,
          );
        }

        if (mealsCategory!.isSuccess &&
            mealsCategoryDetails!.isSuccess &&
            event is LoadCategoryData) {
          emit(state.copyWith(
            mealsCategory: mealsCategory,
            mealsCategoryDetails: mealsCategoryDetails,
          ));
        } else {
          emit(CategoryErrorState(
              mealsCategory!.message ?? 'failed to receive data'));
        }
      } catch (e, s) {
        emit(CategoryErrorState('$e'));
      }
    });
  }
}
