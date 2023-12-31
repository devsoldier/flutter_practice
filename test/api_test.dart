import 'package:flutter_practice/repository/api/client/dio_api_client.dart';
import 'package:flutter_practice/repository/api/client/dio_config.dart';
import 'package:flutter_practice/repository/api/service/default_api_service.dart';
import 'package:flutter_practice/repository/api/service/meal_api_service.dart';
import 'package:flutter_practice/utilities/constant.dart';
import 'package:flutter_practice/utilities/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'mocked_data/mock_data.dart';

void main() {
  late DioAdapter dioAdapter;
  late MealApiService mealAPI;

  setUpAll(() {
    GetIt.I.registerSingleton<MealApiService>(
        MealApiService(apiService: DefaultApiService(DioApiClient(dio))));

    mealAPI = GetIt.I<MealApiService>();
    dioAdapter = DioAdapter(dio: dio);
    dioAdapter.onGet('$mealURL/list.php?c=list', (server) {
      return server.reply(200, mockMealsCategory);
    });
    dioAdapter.onGet('$mealURL/filter.php?c=52965', (server) {
      return server.reply(200, mockMealsCategoryDetails);
    });
    dioAdapter.onGet('$mealURL/lookup.php?i=52874', (server) {
      return server.reply(200, mockMealsDetails);
    });
  });

  group('meals service test |', () {
    test('categories list |', () async {
      final mockResponse = await mealAPI.getCategories();
      expect(mockResponse, Result.success(expectedMealsCategory));
    });
    test('categories details |', () async {
      final mockResponse = await mealAPI.getCategoryDetails('52965');
      expect(mockResponse, Result.success(expectedMealsCategoryDetails));
    });
    test('meal details ', () async {
      final mockResponse = await mealAPI.getDetails(52874);
      expect(mockResponse, Result.success(expectedMealsDetails));
    });
  });
}
