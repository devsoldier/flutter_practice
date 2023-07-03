import 'package:flutter_practice/feature/details/details.page.dart';
import 'package:flutter_practice/feature/home/category_bloc/category_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsWidget extends StatefulWidget {
  const CategoryDetailsWidget({super.key});

  @override
  State<CategoryDetailsWidget> createState() => _CategoryDetailsWidgetState();
}

class _CategoryDetailsWidgetState extends State<CategoryDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    final categoryBloc = context.watch<CategoryBloc>().state;
    if (categoryBloc is CategoryLoadedState) {
      final categoryDetails = categoryBloc.mealsCategoryDetails!.data!.meals;
      return Container(
          alignment: Alignment.center,
          height: 500,
          width: 500,
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: categoryDetails.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                            mealID: int.parse(categoryDetails[index]!.idMeal!),
                            thumnail: categoryDetails[index]!.strMealThumb),
                      ),
                    );
                  },
                  child: buildCards(
                    context,
                    categoryDetails[index]!.strMealThumb,
                    categoryDetails[index]!.strMeal,
                  ));
            },
          ));
    } else if (categoryBloc is CategoryErrorState) {
      return Text('${categoryBloc.errorMessage}');
    } else {
      return const Text('loading');
    }
  }
}

Widget buildCards(BuildContext context, String? thumbnail, String? mealName) {
  return Container(
      margin: EdgeInsets.all(10),
      height: 400,
      child: Column(
        children: [
          Container(
            height: 300,
            width: 300,
            child: Image.network(fit: BoxFit.fill, '$thumbnail'),
          ),
          SizedBox(height: 20),
          Text('$mealName'),
        ],
      ));
}
