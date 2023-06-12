// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_practice/feature/details/widgets/details_steps.dart';
import 'package:flutter_practice/feature/home/home.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_practice/feature/details/details_bloc/details_bloc.dart';
import 'package:flutter_practice/feature/details/widgets/details_ingredient_widget.dart';

class DetailsPage extends StatefulWidget {
  final int? mealID;
  final String? thumnail;
  const DetailsPage({Key? key, required this.mealID, required this.thumnail})
      : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int initialValue = 0;

  final Map<int, Widget> _segments = {
    0: const Text(
      'Ingredients',
      style: TextStyle(
        fontSize: 5,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
    1: const Text(
      'Steps',
      style: TextStyle(
        fontSize: 5,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
  };

  get mealID => widget.mealID;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => DetailsBloc(),
      child: Scaffold(
          body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
                height: size.height * 0.4,
                width: size.width * 1.0,
                color: Colors.black,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network('${widget.thumnail}'),
                )),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 100,
                height: 120,
                child: const Icon(Icons.arrow_back, size: 50),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: SizedBox(
              height: size.height * 0.6,
              width: size.width * 1.0,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: CupertinoSegmentedControl(
                          children: _segments,
                          groupValue: initialValue,
                          selectedColor: Colors.red,
                          unselectedColor: Colors.white,
                          borderColor: Colors.red,
                          onValueChanged: (value) {
                            setState(() {
                              initialValue = value;
                            });
                          }),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (initialValue == 0)
                    DetailsIngredientWidget(mealID: widget.mealID),
                  if (initialValue == 1) DetailsStepsWidget(),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
