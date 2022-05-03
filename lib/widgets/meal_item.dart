import 'package:flutter/material.dart';

import '../screens/meal_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal _meal;
  final Color _color;
  final Function _removeMeal;
  final Function _toggleFavourite;
  final List<String> _favourites;

  MealItem(this._meal, this._color, this._removeMeal, this._toggleFavourite,
      this._favourites,
      {Key? key})
      : super(key: key);

  _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealScreen.Route, arguments: {
      'id': _meal.id,
    }).then((id) {
      if (id != null) _removeMeal(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      splashColor: Theme.of(context).primaryColor,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: _meal.imageUrl != ''
                      ? Image.network(
                          _meal.imageUrl!,
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: double.infinity,
                          height: 100,
                        ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 200,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      _meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text(_meal.duration.toString()),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(_meal.complexity.name),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(_meal.affordability.name),
                    ],
                  ),
                  InkWell(
                    onTap: () => _toggleFavourite(_meal.id),
                    splashColor: Theme.of(context).primaryColor,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.star,
                            color: _favourites.contains(_meal.id)
                                ? Theme.of(context).primaryColor
                                : Colors.grey),
                        SizedBox(
                          width: 6,
                        ),
                        Text('Fav!'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        color: _color,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       this.color.withOpacity(0.7),
        //       this.color,
        //     ],
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //   ),
        //   borderRadius: BorderRadius.circular(15),
        // ),
      ),
    );
  }
}
