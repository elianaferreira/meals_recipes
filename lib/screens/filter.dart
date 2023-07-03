import 'package:flutter/material.dart';
import 'package:meals_recipes/screens/tabs.dart';
import 'package:meals_recipes/utils/dimens.dart';
import 'package:meals_recipes/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersState();
  }
}

class _FiltersState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;

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
          SwitchListTile(
            value: _glutenFreeFilterSet,
            onChanged: (isChecked) => setState(() {
              _glutenFreeFilterSet = isChecked;
            }),
            title: Text(
              'Gluten-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only inlcude glutenf-free meals.  ',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: Dimens.padding),
          )
        ],
      ),
    );
  }
}
