import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/meals_screen.dart';
import './screens/meal_screen.dart';
import './screens/tabs_screen.dart';
import './screens/favourites_screen.dart';
import './screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const route = '/';

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
      initialRoute: MyApp.route,
      routes: {
        MyApp.route: (newContext) => TabsScreen(),
        CategoriesScreen.route: (newContext) => CategoriesScreen(),
        MealsScreen.route: (newContext) => MealsScreen(),
        MealScreen.route: (newContext) => MealScreen(),
        FavouritesScreen.route: (newContext) => FavouritesScreen(),
        FiltersScreen.route: (newContext) => FiltersScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (newContext) => TabsScreen(),
        );
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (newContext) => TabsScreen(),
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
