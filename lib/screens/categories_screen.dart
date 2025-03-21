import 'package:flutter/material.dart';
import '../components/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // cada item com no max 200px na horizontal
        childAspectRatio: 3 / 2, // proporção largura x altura (1,5 no caso)
        crossAxisSpacing: 20, // espaço horizontal entre os itens
        mainAxisSpacing: 20, // espaço vertical entre os itens
      ),
      children: DUMMY_CATEGORIES.map((cat) {
        return CategoryItem(category: cat);
      }).toList(), //gera a lista de categorias da pagina inicial
    );
  }
}
