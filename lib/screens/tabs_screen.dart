import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/main-drawer.dart';
import './categories_screen.dart';
import './meals_screen.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Category> _availableMealsCategories;
  final List<Category> _favouriteMealsCategories;
  final List<String> _favouriteIds;

  const TabsScreen(this._availableMealsCategories,
      this._favouriteMealsCategories, this._favouriteIds,
      {Key? key})
      : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState(
      _availableMealsCategories, _favouriteMealsCategories, _favouriteIds);
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Category> _availableMealsCategories;
  List<Category> _favouriteMealsCategories;
  final List<String> _favouriteIds;
  List<Widget> _pages = [];

  _TabsScreenState(this._availableMealsCategories,
      this._favouriteMealsCategories, this._favouriteIds) {}

  void _setFavouriteState() {
    print('setfav');
    setState(() {
      List<Meal> _favouriteMeals =
          DUMMY_MEALS.where((meal) => _favouriteIds.contains(meal.id)).toList();
      print(_favouriteMeals.length);
      _favouriteMealsCategories = DUMMY_CATEGORIES
          .where((category) => (_favouriteMeals
                  .where((meal) => meal.categories.contains(category.id))
                  .length >
              0))
          .toList();
      print('fav ${_favouriteMealsCategories.length}');
      didChangeDependencies();
    });
  }

  @override
  void didChangeDependencies() {
    print('dSC ${_setFavouriteState}');
    _pages = [
      CategoriesScreen(
          _availableMealsCategories, MealsScreen.Route, _setFavouriteState),
      CategoriesScreen(_favouriteMealsCategories, FavouritesScreen.Route,
          _setFavouriteState),
    ];

    super.didChangeDependencies();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deli meals!'),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.yellow,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favourites',
            ),
          ]),
    );
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //       appBar: AppBar(
    //         title: Text('Deli meals!'),
    //         bottom: TabBar(tabs: <Widget>[
    //           Tab(icon: Icon(Icons.category), text: 'Categories'),
    //           Tab(icon: Icon(Icons.star), text: 'Favourites'),
    //         ]),
    //       ),
    //       body: TabBarView(
    //         children: [CategoriesScreen(), FavouritesScreen()],
    //       )),
    // );
  }
}
