import 'package:flutter/material.dart';

import 'package:meals_recipes/data/dummy_categories.dart';
import 'package:meals_recipes/models/category.dart';
import 'package:meals_recipes/models/meal.dart';
import 'package:meals_recipes/screens/meals.dart';
import 'package:meals_recipes/utils/dimens.dart';
import 'package:meals_recipes/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.availableMeals,
      required this.onToggleFavorite});

  final List<Meal> availableMeals;
  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, Category category) {
    final mealsOfCategory = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: mealsOfCategory,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(Dimens.padding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: Dimens.gridSpace,
          mainAxisSpacing: Dimens.gridSpace), //two columns
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onCategorySelected: _selectCategory,
          )
      ],
    );
  }
}
