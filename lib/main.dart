// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
//import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'utils/app_routes.dart';
import 'screens/tabs_screen.dart';
import 'screens/settings_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(),
      },
      // caso não ache alguma rota, volta pra tela inicial
      onUnknownRoute: (context) {
        return MaterialPageRoute(builder: (_) {
          return TabsScreen();
        });
      },
    );
  }
}
