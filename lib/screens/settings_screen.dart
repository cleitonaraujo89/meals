// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import '../components/main_drawer.dart';
import 'package:flutter/material.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(this.settings, this.onSettingsChanged);

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settingsLocal; //atribuida apois o initState

//sobrescreve o método mantendo a configuração padrão (supe.initState())
//e atribui a settingsLocal as configurações que vieram do main
  @override
  void initState() {
    super.initState();
    settingsLocal = widget.settings;
  }

  Widget _createSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    //switch adaptativo, pega o valor alterado e passa oara a função onchange, em seguida
    //ativa a função passada pelo main com o setingsLocal como parametro
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settingsLocal);
      },
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
                value: settingsLocal.isGlutenFree, // valor inicial
                //quando clicado altera e chama o setState
                onChanged: (value) => setState(
                  () => settingsLocal.isGlutenFree = value,
                ),
              ),
              _createSwitch(
                title: 'Sem Lactose',
                subtitle: 'Só exibe refeições sem lactose!',
                value: settingsLocal.isLactoseFree, // valor inicial
                //quando clicado altera e chama o setState
                onChanged: (value) => setState(
                  () => settingsLocal.isLactoseFree = value,
                ),
              ),
              _createSwitch(
                title: 'Vegetariana',
                subtitle: 'Só exibe refeições vegetarianas!',
                value: settingsLocal.isVegetarian, // valor inicial
                //quando clicado altera e chama o setState
                onChanged: (value) => setState(
                  () => settingsLocal.isVegetarian = value,
                ),
              ),
              _createSwitch(
                title: 'Vegana',
                subtitle: 'Só exibe refeições Veganas!',
                value: settingsLocal.isVegan, // valor inicial
                //quando clicado altera e chama o setState
                onChanged: (value) => setState(
                  () => settingsLocal.isVegan = value,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
