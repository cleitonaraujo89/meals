// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import '../components/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen(this.favoriteMeals);

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Nenhuma Refeição Adcionada'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}
