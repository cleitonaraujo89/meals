import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _createSectionConteiner(Widget child) {
    return Container(
        width: 320,
        height: 250,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, ' Ingredientes'),
            _createSectionConteiner(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Colors.amber[200],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                },
              ),
            ), //_createSectionConteiner
            _createSectionTitle(context, 'Passos'),
            _createSectionConteiner(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text((index + 1).toString()),
                        ),
                        title: Text(meal.steps[index]),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
      floatingActionButton: Consumer<FavoriteProvider>(
        builder: (context, favoriteProvider, _) => FloatingActionButton(
          onPressed: () {
            //onToggleFavorite(meal);
            favoriteProvider.toggleFavorite(meal);
          },
          child: Icon(favoriteProvider.isFavorite(meal)
              ? Icons.star
              : Icons.star_border),
        ),
      ),
    );
  }
}
