// ignore_for_file: prefer_const_constructors
import '../components/main_drawer.dart';
import 'package:flutter/material.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget _createSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch(
                title: 'Sem Glutén',
                subtitle: 'Só exibe refeições sem glúten!',
                value: settings.isGlutenFree, // valor inicial
                //quando clicado altera e chama o setState
                onChanged: (value) => setState(
                  () => settings.isGlutenFree = value,
                ),
              ),
              _createSwitch(
                title: 'Sem Lactose',
                subtitle: 'Só exibe refeições sem lactose!',
                value: settings.isLactoseFree, // valor inicial
                //quando clicado altera e chama o setState
                onChanged: (value) => setState(
                  () => settings.isLactoseFree = value,
                ),
              ),
              _createSwitch(
                title: 'Vegetariana',
                subtitle: 'Só exibe refeições vegetarianas!',
                value: settings.isVegetarian, // valor inicial
                //quando clicado altera e chama o setState
                onChanged: (value) => setState(
                  () => settings.isVegetarian = value,
                ),
              ),
              _createSwitch(
                title: 'Vegana',
                subtitle: 'Só exibe refeições Veganas!',
                value: settings.isVegan, // valor inicial
                //quando clicado altera e chama o setState
                onChanged: (value) => setState(
                  () => settings.isVegan = value,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
