import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_recipes/models/meal.dart';
import 'package:meals_recipes/providers/favorites_provider.dart';
import 'package:meals_recipes/utils/dimens.dart';
import 'package:meals_recipes/widgets/meal_detail_list.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(meal);
                _showInfoMessage(
                    context,
                    wasAdded
                        ? 'Marked as favorite!'
                        : 'Meal is no longer a favorite.');
              },
              icon: Icon(isFavorite ? Icons.star : Icons.star_border)),
        ],
      ),
      body: SingleChildScrollView(
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
    );
  }

  void _showInfoMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
