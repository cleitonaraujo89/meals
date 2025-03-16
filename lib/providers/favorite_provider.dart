import 'package:flutter/material.dart';
import '../models/meal.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Meal> _favoriteMeals = [];

  List get favoriteMeals {
    return [..._favoriteMeals];
  }

  void toggleFavorite(Meal meal) {
    _favoriteMeals.contains(meal)
        ? _favoriteMeals.remove(meal)
        : _favoriteMeals.add(meal);
    notifyListeners();
  }

  bool isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);  }
}
