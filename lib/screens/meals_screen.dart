import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../main.dart';
import '../dummy_data.dart';

class MealsScreen extends StatefulWidget {
  static const route = MyApp.route + 'category-meals';

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  String title = '';
  List<Meal> _categoryMeals = [];

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    title = routeArgs['title'].toString();
    final id = routeArgs['id'];
    _categoryMeals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(id)).toList();

    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      _categoryMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: _categoryMeals
            .map(
              (meal) => MealItem(
                meal,
                Colors.amber,
                _removeMeal,
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
