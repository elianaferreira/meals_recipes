import 'package:flutter/material.dart';

import 'package:meals_recipes/data/dummy_categories.dart';
import 'package:meals_recipes/utils/dimens.dart';
import 'package:meals_recipes/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(Dimens.padding),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: Dimens.gridSpace,
            mainAxisSpacing: Dimens.gridSpace), //two columns
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category)
        ],
      ),
    );
  }
}
