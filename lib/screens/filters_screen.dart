import 'package:flutter/material.dart';

import '../main.dart';
import '../models/option.dart';
import '../widgets/main-drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const Route = MyApp.Route + 'filters';

  final List<Option> switchables;
  final Function onChanged;

  const FiltersScreen(this.switchables, this.onChanged, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your filters')),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('adjust your meal selection',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          Expanded(
            child: ListView(
              children: switchables
                  .map((option) => SwitchListTile(
                      title: Text(option.title),
                      value: option.value,
                      onChanged: (newValue) => onChanged(option, newValue)))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
