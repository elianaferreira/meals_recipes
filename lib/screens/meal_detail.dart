import 'package:flutter/material.dart';

import 'package:meals_recipes/models/meal.dart';
import 'package:meals_recipes/utils/dimens.dart';
import 'package:meals_recipes/widgets/meal_detail_list.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: Dimens.imageHeight,
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(height: Dimens.padding),
              MealDetailList(title: 'Ingredients', body: meal.ingredients),
              const SizedBox(height: Dimens.padding),
              MealDetailList(
                title: 'Steps',
                body: meal.steps,
                verticalPadding: Dimens.paddingSmall,
              ),
              const SizedBox(height: Dimens.padding),
            ],
          ),
        ),
      ),
    );
  }
}
