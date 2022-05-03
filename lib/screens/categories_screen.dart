import 'package:flutter/material.dart';

import '../main.dart';
import '../models/category.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const Route = MyApp.Route + 'categories';

  final List<Category> _availableCategories;
  final String _mealsRoute;
  final Function _setFavouriteState;

  const CategoriesScreen(
      this._availableCategories, this._mealsRoute, this._setFavouriteState,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(_setFavouriteState);
    return GridView(
      padding: const EdgeInsets.all(25),
      children: _availableCategories
          .map(
            (catData) => CategoryItem(
              catData.id,
              catData.title,
              catData.color,
              _mealsRoute,
              _setFavouriteState,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
