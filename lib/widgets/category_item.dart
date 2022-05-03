import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String _id;
  final String _title;
  final Color _color;
  final String _route;
  final Function _setFavouriteState;

  CategoryItem(
      this._id, this._title, this._color, this._route, this._setFavouriteState,
      {Key? key})
      : super(key: key);

  _selectCategory(BuildContext context) {
    print('get fav');
    Navigator.of(context).pushNamed(_route, arguments: {
      'id': _id,
      'title': _title,
    }).then((id) {
      print('set fav');
      print(_setFavouriteState);
      _setFavouriteState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          _title,
          style: Theme.of(context).textTheme.headline5,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _color.withOpacity(0.7),
              _color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
