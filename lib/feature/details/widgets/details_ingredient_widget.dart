// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_practice/feature/details/details_bloc/details_bloc.dart';

class DetailsIngredientWidget extends StatefulWidget {
  final int? mealID;
  const DetailsIngredientWidget({
    Key? key,
    required this.mealID,
  }) : super(key: key);

  @override
  State<DetailsIngredientWidget> createState() =>
      _DetailsIngredientWidgetState();
}

class _DetailsIngredientWidgetState extends State<DetailsIngredientWidget> {
  @override
  void initState() {
    context.read<DetailsBloc>().add(LoadDetailsData(mealID: widget.mealID));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        if (state is DetailsLoadedState) {
          final details = state.mealDetails!.data!.meals;
          final ingredientsList = state.ingredients;
          final measuresList = state.measures;
          return Container(
            height: size.height * 0.51,
            width: size.width * 1,
            child: Column(
              children: [
                Container(
                    height: 490,
                    width: 420,
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: ingredientsList!.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              height: 100,
                              width: 100,
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
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.network(
                                    'https://www.themealdb.com/images/ingredients/${ingredientsList[index]}.png'),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Container(
                              // color: Colors.yellow,
                              // height: 100,
                              // width: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    ingredientsList[index],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    measuresList![index],
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ))
              ],
            ),
          );
        } else if (state is DetailsErrorState) {
          return Text('${state.errorMessage}');
        } else {
          return const Text('loading');
        }
      },
    );
  }
}
