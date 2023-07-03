import 'package:flutter/material.dart';

import 'package:meals_recipes/widgets/filter_item.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersState();
  }
}

class _FiltersState extends State<FiltersScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreenFilterSet = false;
  bool _vegetarianFilterSet = false;
  bool _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreenFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreenFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return false;
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
