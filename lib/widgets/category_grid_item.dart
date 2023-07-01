import 'package:flutter/material.dart';

import 'package:meals_recipes/models/category.dart';
import 'package:meals_recipes/utils/dimens.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onCategorySelected});

  final Category category;
  final void Function(BuildContext ctx, Category category) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onCategorySelected(context, category),
      splashColor: Theme.of(context).primaryColor,
      borderRadius:
          const BorderRadius.all(Radius.circular(Dimens.borderRadius)),
      child: Container(
        padding: const EdgeInsets.all(Dimens.padding),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius:
              const BorderRadius.all(Radius.circular(Dimens.borderRadius)),
        ),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
