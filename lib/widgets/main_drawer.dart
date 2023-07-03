import 'package:flutter/material.dart';
import 'package:meals_recipes/utils/dimens.dart';

enum ScreenIdentifier { meals, filters }

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(ScreenIdentifier identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(Dimens.padding),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: Dimens.iconSizeBig,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: Dimens.padding),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant,
                size: Dimens.iconSizeMedium,
                color: Theme.of(context).colorScheme.onBackground),
            title: Text('Meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: Dimens.titleSize)),
            onTap: () {
              onSelectScreen(ScreenIdentifier.meals);
            },
          ),
          ListTile(
            leading: Icon(Icons.filter_alt,
                size: Dimens.iconSizeMedium,
                color: Theme.of(context).colorScheme.onBackground),
            title: Text('Filters',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: Dimens.titleSize)),
            onTap: () {
              onSelectScreen(ScreenIdentifier.filters);
            },
          )
        ],
      ),
    );
  }
}
