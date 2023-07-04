import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_recipes/data/dummy_meals.dart';

final mealsProvider = Provider(
  (ref) {
    return dummyMeals;
  },
);
