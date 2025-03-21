import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../utils/app_routes.dart';

class MealItem extends StatelessWidget {
  const MealItem(this.meal, {super.key});

  final Meal meal;

  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      AppRoutes.MEAL_DETAIL,
      arguments: meal,
    )
        .then((result) {
      //executa esse bloco somente se algum argumento for passado quando a rota for fechada
      //exemplo: Navigator.of(context).pop(meal.title), quando n é passado retorna como null
      // if (result == null) {
      //   print('Sem resultado');
      // } else {
      //   print('Tem resultado: $result.');
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        //forma do card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                //ClipRRect ajuda a da a forma retangular ao widget e possibilita o BorderRadius pois a img n estava respeitando o RoundedRectangleBorder
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  //puxa a imagem da internet
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  //acerta a posição do conteiner
                  right: 0,
                  bottom: 20,
                  child: Container(
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true, // quebra de linha
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('${meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(meal.complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(meal.costText)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
