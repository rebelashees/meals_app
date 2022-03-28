enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meals {
  final String id, title, imageUrl;
  final List<String> categories, steps, ingredients;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree, isLactoseFree, isVegan, isVegetarian;

  const Meals({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.categories,
    required this.steps,
    required this.ingredients,
    required this.affordability,
    required this.complexity,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });
}
