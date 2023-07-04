import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_recipes/providers/filters_provider.dart';
import 'package:meals_recipes/widgets/filter_item.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersState();
  }
}

class _FiltersState extends ConsumerState<FiltersScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreenFilterSet = false;
  bool _vegetarianFilterSet = false;
  bool _veganFilterSet = false;

  @override
  void initState() {
    super.initState();

    final filters = ref.read(filtersProvider);
    _glutenFreeFilterSet = filters[Filter.glutenFree]!;
    _lactoseFreenFilterSet = filters[Filter.lactoseFree]!;
    _vegetarianFilterSet = filters[Filter.vegetarian]!;
    _veganFilterSet = filters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: WillPopScope(
        onWillPop: () async {
          ref.watch(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreenFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return true;
        },
        child: Column(
          children: [
            FilterItem(
              title: 'Gluten-free',
              subtitle: 'Only inlcude gluten-free meals.',
              filterValue: _glutenFreeFilterSet,
              onCheckedChange: (isChecked) => setState(() {
                _glutenFreeFilterSet = isChecked;
              }),
            ),
            FilterItem(
              title: 'Lactose-free',
              subtitle: 'Only inlcude lactose-free meals.',
              filterValue: _lactoseFreenFilterSet,
              onCheckedChange: (isChecked) => setState(() {
                _lactoseFreenFilterSet = isChecked;
              }),
            ),
            FilterItem(
              title: 'Vegetarian',
              subtitle: 'Only inlcude vegetarian meals.',
              filterValue: _vegetarianFilterSet,
              onCheckedChange: (isChecked) => setState(() {
                _vegetarianFilterSet = isChecked;
              }),
            ),
            FilterItem(
              title: 'Vegan ',
              subtitle: 'Only inlcude vegan meals.',
              filterValue: _veganFilterSet,
              onCheckedChange: (isChecked) => setState(() {
                _veganFilterSet = isChecked;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
