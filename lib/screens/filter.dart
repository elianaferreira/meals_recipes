import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_recipes/providers/filters_provider.dart';
import 'package:meals_recipes/widgets/filter_item.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: Column(
        children: [
          FilterItem(
            title: 'Gluten-free',
            subtitle: 'Only inlcude gluten-free meals.',
            filterValue: activeFilters[Filter.glutenFree]!,
            onCheckedChange: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
          ),
          FilterItem(
              title: 'Lactose-free',
              subtitle: 'Only inlcude lactose-free meals.',
              filterValue: activeFilters[Filter.lactoseFree]!,
              onCheckedChange: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.lactoseFree, isChecked);
              }),
          FilterItem(
            title: 'Vegetarian',
            subtitle: 'Only inlcude vegetarian meals.',
            filterValue: activeFilters[Filter.vegetarian]!,
            onCheckedChange: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
          ),
          FilterItem(
              title: 'Vegan ',
              subtitle: 'Only inlcude vegan meals.',
              filterValue: activeFilters[Filter.vegan]!,
              onCheckedChange: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegan, isChecked);
              }),
        ],
      ),
    );
  }
}
