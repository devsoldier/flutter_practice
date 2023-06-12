import 'dart:developer';

import 'package:flutter_practice/repository/api/service/meal_api_service.dart';
import 'package:flutter_practice/repository/data_class/meals_data/meal_details.dart';
import 'package:flutter_practice/repository/data_class/meals_data/meals.dart';
import 'package:flutter_practice/utilities/result.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final _mealAPI = GetIt.I<MealApiService>();
  Result<Meals<MealDetails>>? mealDetails;
  List<String> ingredients = [];
  List<String> measures = [];

  DetailsBloc() : super(DetailsInitial()) {
    on<DetailsEvent>((event, emit) async {
      try {
        if (event is DetailsErrorEvent) {
          emit(const DetailsErrorState('error'));
          return;
        }
        if (event is LoadDetailsData) {
          mealDetails = await _mealAPI.getDetails(event.mealID);
        }

        if (mealDetails!.data!.meals.first!.strIngredient2 != null) {
          final mealDetailsMap = mealDetails!.data!.meals.first!.toJson();
          mealDetailsMap.forEach((key, value) {
            for (int i = 1; i <= 20; i++) {
              if (key == 'strIngredient${i}') {
                ingredients.add(value);
                ingredients.removeWhere((element) => element == '');
              }
              if (key == 'strMeasure${i}') {
                measures.add(value);
                measures.removeWhere((element) => element == '');
              }
            }
          });
        }

        if (mealDetails!.isSuccess && event is LoadDetailsData) {
          emit(state.copyWith(
            mealDetails: mealDetails,
            ingredients: ingredients,
            measures: measures,
          ));
        } else {
          emit(DetailsErrorState(
              mealDetails!.message ?? 'failed to receive data'));
        }
      } catch (e, s) {
        emit(DetailsErrorState('$e'));
      }
    });
  }
}
