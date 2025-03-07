// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import '../data/dummy_data.dart';
import '../components/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  //usados para navegação via construtor
  //final Category category;
  //const CategoriesMealsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    //navegação via rota - pegando a categoria que é passada como argumento
    final Category category =
        ModalRoute.of(context)?.settings.arguments as Category;

    //categogyMeals recebe uma lista tom todos os itens com mesmo id da categoria atual
    final List categogyMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      // cria um ListView com cada item na lista
      body: ListView.builder(
        itemCount: categogyMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(categogyMeals[index]);
        },
      ),
    );
  }
}
