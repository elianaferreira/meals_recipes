import 'package:flutter/material.dart';

import 'package:meals_recipes/utils/dimens.dart';

class FilterItem extends StatelessWidget {
  const FilterItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.filterValue,
      required this.onCheckedChange});

  final String title;
  final String subtitle;
  final bool filterValue;
  final void Function(bool isChecked) onCheckedChange;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: filterValue,
      onChanged: onCheckedChange,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
    );
  }
}
