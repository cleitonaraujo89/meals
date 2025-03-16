import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
 

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0; //começa com a tela inicial
  late final List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Categorias', 'screen': const CategoriesScreen()},
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen()
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Controlador de abas
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),

      // no body temos a lista das telas que serão exibidas em cada aba
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primaryFixed,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.white,
          // type: BottomNavigationBarType.shifting, faz um movimento quando selecionado
          currentIndex: _selectedScreenIndex,
          onTap:
              _selectScreen, // ao toque ativa a função e passa o index do item clicado
          items: const [
            BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).colorScheme.primaryFixed,
              icon: Icon(Icons.category),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).colorScheme.primaryFixed,
              icon: Icon(Icons.star),
              label: 'Favoritos',
            )
          ]),
    );
  }
}
