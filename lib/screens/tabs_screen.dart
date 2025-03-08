// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Controlador de abas
    return DefaultTabController(
      length: 2, // indica q serão 2 abas
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vamos Cozinhar?'),
          //abaixo do titulo a TabBar contendo as 2 abas
          bottom: TabBar(
              labelColor: Colors.white, //cor da ativa
              unselectedLabelColor: Colors.white70, // cor da não ativa
              indicatorColor: Colors.white, // cor do tracinho
              //indicatorSize: TabBarIndicatorSize.tab, // outro modelo de traço
              indicatorWeight: 5, // altura do traço
              // lista contendo o que sera exibido na tab 1 e 2
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categorias',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favoritos',
                )
              ]),
        ),
        // no body temos a lista das telas que serão exibidas em cada aba
        body: TabBarView(
          children: [
            CategoriesScreen(), 
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}
