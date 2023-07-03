// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_practice/repository/data_class/meals_data/meal_details.dart';
import 'package:flutter_practice/repository/data_class/meals_data/meals.dart';
import 'package:flutter_practice/repository/data_class/meals_data/meals_category.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocked_data/mock_data.dart';

void main() {
  group('Parsing Test', () {
    test('parse meals category', () {
      expect(
          Meals<MealsCategory>.fromJson((mockMealsCategory),
              (json) => MealsCategory.fromJson(json as Map<String, dynamic>)),
          expectedMealsCategory);
    });
    test('parse meals category details', () {
      expect(
          Meals<MealsCategoryDetails>.fromJson(
              (mockMealsCategoryDetails),
              (json) =>
                  MealsCategoryDetails.fromJson(json as Map<String, dynamic>)),
          expectedMealsCategoryDetails);
    });
    test('parse meals details', () {
      expect(
          Meals<MealDetails>.fromJson((mockMealsDetails),
              (json) => MealDetails.fromJson(json as Map<String, dynamic>)),
          expectedMealsDetails);
    });
  });
}
