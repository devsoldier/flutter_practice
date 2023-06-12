import 'package:flutter_practice/feature/home/category_bloc/category_bloc.dart';
import 'package:flutter_practice/repository/api/client/dio_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

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
