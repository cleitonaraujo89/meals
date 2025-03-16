import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import '../components/meal_item.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
 
  final List<Meal> meals;

  const CategoriesMealsScreen(this.meals, {super.key});

  @override
  Widget build(BuildContext context) {
    //navegação via rota - pegando a categoria que é passada como argumento, perceba que está dentro do build
    final Category category =
        ModalRoute.of(context)?.settings.arguments as Category;

    //categogyMeals recebe uma lista tom todos os itens com mesmo id da categoria atual
    final List categogyMeals = meals.where((meal) {
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
