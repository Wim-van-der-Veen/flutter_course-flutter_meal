import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/main-drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const route = MyApp.route + 'filters';

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class Option {
  final String name;
  bool value;
  Option(this.name, this.value);
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<Option> _switchables = [
    Option(
      'gluten free',
      false,
    ),
    Option(
      'lactose free',
      false,
    ),
    Option(
      'vegetarian',
      false,
    ),
    Option(
      'vegan',
      false,
    ),
  ];

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
              children: _switchables
                  .map((option) => SwitchListTile(
                        title: Text(option.name),
                        value: option.value,
                        onChanged: (newState) =>
                            setState(() => option.value = newState),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
