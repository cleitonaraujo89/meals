import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _createItem(
            icon: Icons.restaurant,
            label: 'Refeições',
            onTap: () {
              //Navigator.of(context).pop();

              //subistitui a rota atual pela nova podendo supstituir o pop em alguns casos
              //pois perde aquela setinha para voltar no canto superior direito
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            },
          ),
          _createItem(
            icon: Icons.settings,
            label: 'Configurações',
            onTap: () {
              Navigator.of(context).pop(); // Fecha o Drawer
              Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
            },
          ),
        ],
      ),
    );
  }
}
