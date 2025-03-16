// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/favorite_provider.dart';
import 'package:meals/models/settings.dart';
//import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'utils/app_routes.dart';
import 'screens/tabs_screen.dart';
import 'screens/settings_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //estancia o objeto que vai ser alterado quando for modificado em settings_screen
  Settings settings = Settings();
  //recebe inicialmente a lista padrão, caso o usuario escolha algum filtro
  //será atribuido uma nova lista após a função abaixo ser executada
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings; //altera o objeto com os novos valores
      //filtra a lista de acordo com as opções selecionadas pelo usuário
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        final filterVegan = settings.isVegan && !meal.isVegan;

        return !filterGluten &&
            !filterLactose &&
            !filterVegetarian &&
            !filterVegan;
      }).toList(); // só passa o que for True em todas, lembrando q o padrão é todas
      // falsas em settings, ou seja se nada for alterado... tudo true, caso algo seja alterado
      //settings.isGlutenFree (true) e meal.isGlutenFree (true  que vira false) no fim é
      //false q vira true, caso set. true e meal false (q vira true) = true q no fim vira false e n entra na lista
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoriteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            //colorSchemeSeed: Colors.pink,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink)
                .copyWith(primary: Colors.pink, secondary: Colors.amber),
            fontFamily: 'Raleway',
            useMaterial3: true,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            textTheme: ThemeData.light().textTheme.copyWith(
                  titleLarge: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Raleway',
                  ),
                  titleMedium: TextStyle(
                    fontSize: 18,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.w700,
                  ),
                ),
            appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.pink,
              foregroundColor: Colors.white,
            )),
        //home: CategoriesScreen(), // puxa direto da rota
        routes: {
          // pagina inicial é o controlador de abas
          AppRoutes.HOME: (ctx) => TabsScreen(),
          AppRoutes.CATEGORIES_MEALS: (ctx) =>
              CategoriesMealsScreen(_availableMeals),
          AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
          AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
        },
        // caso não ache alguma rota, volta pra tela inicial
        onUnknownRoute: (context) {
          return MaterialPageRoute(builder: (_) {
            return TabsScreen();
          });
        },
      ),
    );
  }
}
