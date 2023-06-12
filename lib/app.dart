import 'package:flutter/material.dart';
import 'feature/menu/menu.page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white10,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          elevation: 0,
        ),
      ),
      home: const MenuPage(),
    );
  }
}
