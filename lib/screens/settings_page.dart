import 'package:flutter/material.dart';
import '../models/color_theme_data.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Tema Seçimi Yapınız')),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SwitchCard());
  }
}

class SwitchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Text greenText = Text('Green', style: TextStyle(color: Colors.green));
    Text redText = Text('Red', style: TextStyle(color: Colors.red));
    bool _value = Provider.of<ColorThemeData>(context).isGreen;

    return Card(
      child: SwitchListTile(
        subtitle: _value ? greenText : redText,
        title: Text(
          'Change Theme Color',
          style: TextStyle(color: Colors.black),
        ),
        value: _value,
        onChanged: (bool value) {
          Provider.of<ColorThemeData>(context, listen: false)
              .switchTheme(value);
        },
      ),
    );
  }
}
