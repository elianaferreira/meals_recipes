import 'package:flutter/material.dart';

import 'package:meals_recipes/screens/tabs.dart';
import 'package:meals_recipes/widgets/filter_item.dart';
import 'package:meals_recipes/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      drawer: MainDrawer(
        onSelectScreen: (identifier) {
          Navigator.of(context).pop();
          if (identifier == ScreenIdentifier.meals) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const TabsScreen(),
            ));
          }
        },
      ),
      body: Column(
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
    );
  }
}
