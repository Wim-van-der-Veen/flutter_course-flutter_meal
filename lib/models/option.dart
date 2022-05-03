class Option {
  final String name;
  final String title;
  bool value;
  Option(this.name, this.title, this.value);
}

final List<String> OptionNames = [
  'isGlutenFree',
  'isLactoseFree',
  'isVegetarian',
  'isVegan',
];
