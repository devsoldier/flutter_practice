import 'package:flutter_practice/feature/details/details_bloc/details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsStepsWidget extends StatelessWidget {
  const DetailsStepsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<DetailsBloc, DetailsState>(builder: (context, state) {
      if (state is DetailsLoadedState) {
        final details = state.mealDetails!.data!.meals.first!.strInstructions;
        return Container(
          alignment: Alignment.center,
          height: size.height * 0.51,
          width: size.width * 1,
          child: Text('$details'),
        );
      } else if (state is DetailsErrorState) {
        return Text('${state.errorMessage}');
      } else {
        return const Text('loading');
      }
    });
  }
}
