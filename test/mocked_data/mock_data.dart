import 'package:flutter_practice/repository/data_class/meals_data/meal_details.dart';
import 'package:flutter_practice/repository/data_class/meals_data/meals.dart';
import 'package:flutter_practice/repository/data_class/meals_data/meals_category.dart';

const Meals<MealsCategory> expectedMealsCategory = Meals([
  MealsCategory(strCategory: "Beef"),
  MealsCategory(strCategory: "Breakfast"),
]);

final Map<String, dynamic> mockMealsCategory = {
  "meals": [
    {"strCategory": "Beef"},
    {"strCategory": "Breakfast"}
  ]
};

const Meals<MealsCategoryDetails> expectedMealsCategoryDetails = Meals([
  MealsCategoryDetails(
    idMeal: '52965',
    strMealThumb: 'https://www.themealdb.com/images/media/meals/1550441882.jpg',
    strMeal: 'Breakfast Potatoes',
  ),
  MealsCategoryDetails(
    idMeal: '52895',
    strMealThumb:
        'https://www.themealdb.com/images/media/meals/utxryw1511721587.jpg',
    strMeal: 'English Breakfast',
  ),
]);

final Map<String, dynamic> mockMealsCategoryDetails = {
  "meals": [
    {
      "strMeal": "Breakfast Potatoes",
      "strMealThumb":
          "https://www.themealdb.com/images/media/meals/1550441882.jpg",
      "idMeal": "52965"
    },
    {
      "strMeal": "English Breakfast",
      "strMealThumb":
          "https://www.themealdb.com/images/media/meals/utxryw1511721587.jpg",
      "idMeal": "52895"
    }
  ]
};

const Meals<MealDetails> expectedMealsDetails = Meals([
  MealDetails(
      idMeal: '52874',
      strMeal: 'Beef and Mustard Pie',
      strCategory: 'Beef',
      strArea: 'British',
      strMealThumb:
          'https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg',
      strIngredient1: 'Beef',
      strMeasure1: '1kg'),
]);

final Map<String, dynamic> mockMealsDetails = {
  "meals": [
    {
      "idMeal": "52874",
      "strMeal": "Beef and Mustard Pie",
      "strCategory": "Beef",
      "strArea": "British",
      "strMealThumb":
          "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg",
      "strIngredient1": "Beef",
      "strMeasure1": "1kg",
    }
  ]
};
