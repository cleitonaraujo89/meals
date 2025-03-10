// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen(this.favoriteMeals);

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Minhas Refeições Favoritas'),
    );
  }
}