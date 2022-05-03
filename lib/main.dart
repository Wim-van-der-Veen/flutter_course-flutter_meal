import 'package:flutter/material.dart';
import 'package:flutter_meal/dummy_data.dart';
import 'package:flutter_meal/models/category.dart';

import './screens/meals_screen.dart';
import './screens/meal_screen.dart';
import './screens/tabs_screen.dart';
import './screens/favourites_screen.dart';
import './screens/filters_screen.dart';
import './models/meal.dart';
import './models/option.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static const Route = '/';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Option> options = [
    Option(
      'isGlutenFree',
      'gluten free',
      false,
    ),
    Option(
      'isLactoseFree',
      'lactose free',
      false,
    ),
    Option(
      'isVegetarian',
      'vegetarian',
      false,
    ),
    Option(
      'isVegan',
      'vegan',
      false,
    ),
  ];

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];
  List<Category> _availableMealsCategories = DUMMY_CATEGORIES;
  List<Category> _favouriteMealsCategories = [];

  void _updateOptions(option, newState) {
    setState(() {
      option.value = newState;
      _availableMeals =
          DUMMY_MEALS.where((meal) => meal.satisfiesOptions(options)).toList();
      _availableMealsCategories = DUMMY_CATEGORIES
          .where((category) => (_availableMeals
                  .where((meal) => meal.categories.contains(category.id))
                  .length >
              0))
          .toList();
      print('AV ${_availableMealsCategories.length}');
    });
  }

  List<String> _favouriteIds = [];

  void _updateFavourites() {
    setState(() {
      _favouriteMeals =
          DUMMY_MEALS.where((meal) => _favouriteIds.contains(meal.id)).toList();
      print(_favouriteMeals.length);
      _favouriteMealsCategories = DUMMY_CATEGORIES
          .where((category) => (_favouriteMeals
                  .where((meal) => meal.categories.contains(category.id))
                  .length >
              0))
          .toList();
      print('FAV ${_favouriteMealsCategories.length}');
    });
  }

  void _setFavouriteState() {
    setState(() {
      _updateFavourites();
    });
  }

  // void toggleFavourite(id) {
  //   if (!favouriteIds.contains(id)) {
  //     favouriteIds.add(id);
  //     _updateFavourites();
  //   } else if (favouriteIds.remove(id)) {
  //     _updateFavourites();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        secondaryHeaderColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline4: TextStyle(
                fontSize: 32,
                fontFamily: 'RobotoCondensed',
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline5: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                color: Color.fromRGBO(20, 51, 51, 1),
                fontWeight: FontWeight.bold,
              ),
              headline6: TextStyle(
                fontSize: 16,
                fontFamily: 'RobotoCondensed',
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      initialRoute: MyApp.Route,
      routes: {
        MyApp.Route: (newContext) => TabsScreen(_availableMealsCategories,
            _favouriteMealsCategories, _favouriteIds),
        // CategoriesScreen.Route: (newContext) => CategoriesScreen(options),
        MealsScreen.Route: (newContext) => MealsScreen(
              _availableMeals,
              _favouriteIds,
              _setFavouriteState,
            ),
        MealScreen.Route: (newContext) => MealScreen(),
        FavouritesScreen.Route: (newContext) => MealsScreen(
              _favouriteMeals,
              _favouriteIds,
              _setFavouriteState,
            ),
        FiltersScreen.Route: (newContext) => FiltersScreen(
              options,
              _updateOptions,
            ),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (newContext) => TabsScreen(_availableMealsCategories,
              _favouriteMealsCategories, _favouriteIds),
        );
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (newContext) => TabsScreen(_availableMealsCategories,
            _favouriteMealsCategories, _favouriteIds),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
