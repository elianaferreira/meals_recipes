import 'package:flutter/material.dart';

import 'package:meals_recipes/models/meal.dart';
import 'package:meals_recipes/screens/meal_detail.dart';
import 'package:meals_recipes/utils/dimens.dart';
import 'package:meals_recipes/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    var noMealsWidget = Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('Uh oh... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                )),
        const SizedBox(height: Dimens.padding),
        Text(
          'There is no meals for this category.',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        )
      ]),
    );

    Widget content = meals.isEmpty
        ? noMealsWidget
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) => MealItem(
              meal: meals[index],
              onMealSelected: (ctx, meal) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => MealDetailScreen(meal: meal),
                  )),
            ),
          );

    if (title == null) return content;

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
