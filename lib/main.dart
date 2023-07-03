import 'package:flutter_practice/feature/home/category_bloc/category_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/repository/api/service/meal_api_service.dart';
import 'package:get_it/get_it.dart';

import 'app.dart';
import 'repository/api/client/dio_api_client.dart';
import 'repository/api/client/dio_config.dart';
import 'repository/api/service/default_api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependenciesSetup();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => CategoryBloc()),
    ],
    child: const MyApp(),
  ));
}

Future<void> dependenciesSetup() async {
  GetIt.I.registerSingleton<MealApiService>(
    MealApiService(apiService: DefaultApiService(DioApiClient(dio))),
  );

  final logInterceptor = LogInterceptor(
    request: true,
    requestHeader: true,
    requestBody: false,
    error: true,
    responseHeader: false,
    responseBody: true,
  );

  dio.interceptors.addAll([
    logInterceptor,
  ]);
}
