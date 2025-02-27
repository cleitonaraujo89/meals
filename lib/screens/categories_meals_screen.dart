import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  
  //usados para navegação via construtor
  //final Category category;
  //const CategoriesMealsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    //navegação via rota - pegando a categoria que é passada como argumento
    final Category category = ModalRoute.of(context)?.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text('Receitas por Categoria ${category.id}'),
      ),
    );
  }
}