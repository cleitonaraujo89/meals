// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:meals/providers/favorite_provider.dart';
import 'package:provider/provider.dart';
import '../components/meal_item.dart';

class FavoriteScreen extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    final favoriteList = Provider.of<FavoriteProvider>(context);

    if (favoriteList.favoriteMeals.isEmpty) {
      return Center(
        child: Text('Nenhuma Refeição Adcionada'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteList.favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoriteList.favoriteMeals[index]);
        },
      );
    }
  }
}
