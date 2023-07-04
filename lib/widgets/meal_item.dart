import 'package:flutter/material.dart';

import 'package:meals_recipes/utils/dimens.dart';
import 'package:meals_recipes/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_recipes/models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onMealSelected});

  final Meal meal;
  final void Function(BuildContext context, Meal meal) onMealSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(Dimens.padding),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.borderRadius)),
      clipBehavior: Clip.hardEdge,
      elevation: Dimens.elevation,
      child: InkWell(
          onTap: () {
            onMealSelected(context, meal);
          },
          child: Stack(
            children: [
              Hero(
                tag: meal.id,
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                  height: Dimens.itemHeight,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimens.paddingMedium),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: Dimens.titleSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: Dimens.paddingMedium),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealItemTrait(
                                icon: Icons.schedule,
                                label: '${meal.duration} min'),
                            MealItemTrait(
                                icon: Icons.work, label: meal.complecityText),
                            MealItemTrait(
                                icon: Icons.attach_money,
                                label: meal.affordabilityText)
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
