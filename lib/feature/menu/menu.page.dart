import 'dart:math';

import 'package:flutter_practice/feature/home/home.page.dart';
import 'package:flutter_practice/feature/menu/widgets/menu_tile.dart';
import 'package:flutter_practice/shared_widgets/search_bar.dart';
import 'package:flutter_practice/utilities/rng.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int? mealItemLength;
  int? drinkItemLength;
  final focusNode = FocusNode();

  void generateRandomNumber() {
    mealItemLength = randomNumberGenerator(300);
    drinkItemLength = randomNumberGenerator(300);
  }

  @override
  void initState() {
    generateRandomNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
            ),
          )
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: Center(
          child: Container(
            height: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                SearchBarWidget(focusNode: focusNode),
                const SizedBox(height: 50),
                Column(
                  children: [
                    MenuTile(
                      imageURL: 'https://picsum.photos/200/300',
                      title: 'Food',
                      length: mealItemLength,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    MenuTile(
                      imageURL: 'https://picsum.photos/200/300',
                      title: 'Drink',
                      length: drinkItemLength,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
