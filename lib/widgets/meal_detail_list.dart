import 'package:flutter/material.dart';
import 'package:meals_recipes/utils/dimens.dart';

class MealDetailList extends StatelessWidget {
  const MealDetailList(
      {super.key,
      required this.title,
      required this.body,
      this.verticalPadding});

  final String title;
  final List<String> body;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: Dimens.paddingMedium),
        for (final item in body)
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimens.padding, vertical: verticalPadding ?? 0),
            child: Text(item,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          )
      ],
    );
  }
}
