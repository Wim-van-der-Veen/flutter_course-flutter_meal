import 'package:flutter/material.dart';

import './meal_item.dart';
import '../main.dart';
import '../dummy_data.dart';

class MealsScreen extends StatelessWidget {
  static const route = MyApp.route + 'category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final title = routeArgs['title'];
    final categoryMeals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text((title != null) ? title : 'missing title'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: categoryMeals
            .map(
              (meal) => MealItem(
                meal,
                Colors.amber,
              ),
            )
            .toList(),
        // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //   maxCrossAxisExtent: 200,
        //   childAspectRatio: 3 / 2,
        //   crossAxisSpacing: 20,
        //   mainAxisSpacing: 20,
        // ),
      ),
    );
  }
}
