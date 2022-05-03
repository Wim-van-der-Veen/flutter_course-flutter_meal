import 'package:flutter/material.dart';

import '../main.dart';
import '../dummy_data.dart';

class MealScreen extends StatefulWidget {
  static const Route = MyApp.Route + 'meal';

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(children: [
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Container(
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (_, index) => Card(
                    color: Theme.of(context).secondaryHeaderColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index]),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Text(
                  'Steps',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: meal.recipeSteps.length,
                    itemBuilder: (_, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(child: Text('# ${index + 1}')),
                          title: Text(meal.recipeSteps[index]),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () => Navigator.of(context).pop(meal.id),
      ),
    );
  }
}
