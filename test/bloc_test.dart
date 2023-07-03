import 'package:flutter_practice/feature/details/details_bloc/details_bloc.dart';
import 'package:flutter_practice/feature/home/category_bloc/category_bloc.dart';
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
  final dioAdapter = DioAdapter(dio: dio);
  GetIt.I.registerSingleton<MealApiService>(
      MealApiService(apiClient: DefaultApiService(DioApiClient(dio))));
  group('Category bloc | ', () {
    final bloc = CategoryBloc();
    test('initial |', () {
      expect(bloc.state, CategoryInitial());
    });

    test('category data |', () async {
      dioAdapter.onGet('$mealURL/list.php?c=list', (server) {
        return server.reply(200, mockMealsCategory);
      });
      dioAdapter.onGet('$mealURL/filter.php?c=Beef', (server) {
        return server.reply(200, mockMealsCategoryDetails);
      });
      bloc.add(const LoadCategoryData());
      await Future.delayed(const Duration(seconds: 1), () {});
      expect(
        bloc.state,
        CategoryLoadedState(
          mealsCategory: Result.success(expectedMealsCategory),
          mealsCategoryDetails: Result.success(expectedMealsCategoryDetails),
        ),
      );
    });

    test('category event error |', () async {
      bloc.add(CategoryErrorEvent());
      await Future.delayed(const Duration(seconds: 1), () {});
      expect(bloc.state, CategoryErrorState('failed to receive data'));
    });
    test('category api error |', () async {
      dioAdapter.onGet('$mealURL/list.php?c=list', (server) {
        return server.reply(503, {});
      });
      bloc.add(const LoadCategoryData());
      await Future.delayed(const Duration(seconds: 1), () {});
      expect(bloc.state,
          const CategoryErrorState('Null check operator used on a null value'));
    });
  });
  group('Detail bloc | ', () {
    final bloc = DetailsBloc();
    test('initial |', () {
      expect(bloc.state, DetailsInitial());
    });

    test('details details |', () async {
      dioAdapter.onGet('$mealURL/lookup.php?i=52874', (server) {
        return server.reply(200, mockMealsDetails);
      });
      bloc.add((const LoadDetailsData(mealID: 52874)));
      await Future.delayed(const Duration(seconds: 1), () {});
      expect(
          bloc.state,
          DetailsLoadedState(
              mealDetails: Result.success(expectedMealsDetails),
              ingredients: [],
              measures: []));
    });

    test('details event error |', () async {
      bloc.add(DetailsErrorEvent());
      await Future.delayed(const Duration(seconds: 1), () {});
      expect(bloc.state, const DetailsErrorState('error'));
    });

    test('details api error |', () async {
      dioAdapter.onGet('$mealURL/lookup.php?i=52874', (server) {
        return server.reply(503, {});
      });
      bloc.add(const LoadDetailsData(mealID: 52874));
      await Future.delayed(const Duration(seconds: 2), () {});
      expect(bloc.state,
          const DetailsErrorState('Null check operator used on a null value'));
    });
  });
}
