import 'option.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Cheap,
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String? imageUrl;
  final List<String> ingredients;
  final List<String> recipeSteps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegetarian;
  final bool isVegan;

  const Meal(
    this.id,
    this.title, {
    this.categories = const [],
    this.imageUrl = '',
    this.ingredients = const [],
    this.recipeSteps = const [],
    this.duration = 30,
    this.complexity = Complexity.Simple,
    this.affordability = Affordability.Affordable,
    this.isGlutenFree = false,
    this.isLactoseFree = false,
    this.isVegetarian = false,
    this.isVegan = false,
  });

  Map<String, bool> _toMap() {
    return {
      'isGlutenFree': isGlutenFree,
      'isLactoseFree': isLactoseFree,
      'isVegetarian': isVegetarian,
      'isVegan': isVegan,
    };
  }

  bool getOption(optionName) {
    final _map = _toMap();
    return _map.containsKey(optionName) ? _map[optionName]! : false;
  }

  bool satisfiesOptions(List<Option> options) {
    print(title);
    print(_toMap());
    options.forEach((option) => print('${option.name}: ${option.value}'));
    return options
        .every((option) => !(option.value && !getOption(option.name)));
  }
}
