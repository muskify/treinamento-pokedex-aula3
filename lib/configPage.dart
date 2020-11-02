import 'package:flutter/material.dart';
import 'package:pokedex/settings.dart';

class ConfigPage extends StatefulWidget {
  ConfigPage({Key key}) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class SettingDropdown extends StatelessWidget {
  SettingDropdown({this.value, this.options, this.callback});

  final String value;
  final List<String> options;
  final Function callback;

  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        callback(newValue);
      },
      items: options.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex - Configurações'),
      ),
      body: Container(
        color: Colors.lightBlue.withOpacity(0.5),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('Tema:'),
                ),
                SettingDropdown(
                  value: settings.theme,
                  options: [THEME_LIGHT, THEME_DARK],
                  callback: (String value) {
                    setState(() {});
                  },
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text('Número de Pokémons:'),
                ),
                SettingDropdown(
                  value: settings.numPokemons.toString(),
                  options: ['5', '10', '15', '20', '30'],
                  callback: (String value) {
                    setState(() {});
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
