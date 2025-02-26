// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
          colorSchemeSeed: Colors.pink,
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
      home: CategoriesScreen(),
    );
  }
}
