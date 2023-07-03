// ignore: unused_import
import 'dart:developer';

import 'package:flutter_practice/feature/home/category_bloc/category_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  void loadHomeData() async {
    context.read<CategoryBloc>().add(const LoadCategoryData());
  }

  @override
  void initState() {
    loadHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is CategoryLoadedState) {
        final categoryList = state.mealsCategory!.data!.meals;
        return Container(
          alignment: Alignment.center,
          height: 180,
          width: 400,
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return Container(
                  height: 100,
                  width: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<CategoryBloc>().add(
                                LoadCategoryData(
                                  categoryName:
                                      categoryList[index]!.strCategory,
                                ),
                              );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38,
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(1, 2),
                                      ),
                                    ]),
                                child:
                                    Text('${categoryList[index]!.strCategory}'),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ));
            },
          ),
        );
      } else if (state is CategoryErrorState) {
        return Text('${state.errorMessage}');
      } else {
        return const Text('loading');
      }
    });
  }
}
