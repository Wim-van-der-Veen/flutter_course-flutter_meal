import 'package:flutter/material.dart';

import '../main.dart';

class FavouritesScreen extends StatelessWidget {
  static const Route = MyApp.Route + 'favourites';

  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Favourites'));
  }
}
