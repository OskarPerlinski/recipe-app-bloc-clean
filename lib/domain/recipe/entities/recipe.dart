class RecipeEntity {
  final String name;
  final String rate;
  final String image;
  final String kcal;
  final String time;
  final List<String> ingredientsName;
  final List<String> descriptions;
  final List<String> directions;

  RecipeEntity({
    required this.name,
    required this.rate,
    required this.image,
    required this.kcal,
    required this.time,
    required this.ingredientsName,
    required this.descriptions,
    required this.directions,
  });
}
