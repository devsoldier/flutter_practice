import 'package:flutter_practice/feature/home/widgets/category_detail.dart';
import 'package:flutter_practice/feature/home/widgets/category_widget.dart';
import 'package:flutter_practice/shared_widgets/search_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_bloc/category_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Good morning Akila!'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Colors.black,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => CategoryBloc(),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: FocusManager.instance.primaryFocus!.unfocus,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    height: 80,
                    width: 350,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                'Delivering to',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                'Current Location',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            height: 100,
                            width: 100,
                            child: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ),
                  SearchBarWidget(focusNode: focusNode),
                  const CategoryWidget(),
                  const CategoryDetailsWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
