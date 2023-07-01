import 'package:flutter/material.dart';
import 'package:meals_recipes/utils/dimens.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon, size: Dimens.iconSize, color: Colors.white),
      const SizedBox(width: Dimens.paddingSmall),
      Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      const SizedBox(width: Dimens.padding)
    ]);
  }
}
