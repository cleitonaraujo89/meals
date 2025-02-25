import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // cada item com no max 200px na horizontal
        childAspectRatio: 3 / 2, // proporção largura x altura (1,5 no caso)
        crossAxisSpacing: 20, // espaço horizontal entre os itens
        mainAxisSpacing: 20, // espaço vertical entre os itens
      ),
      children: [],
    );
  }
}