// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:recipe_app/domain/recipe/entities/recipe.dart';

class RecipeModel {
  final String name;
  final String rate;
  final String image;
  final String kcal;
  final String time;
  final List<String> ingredientsName;
  final List<String> descriptions;
  final List<String> directions;

  RecipeModel({
    required this.name,
    required this.rate,
    required this.image,
    required this.kcal,
    required this.time,
    required this.ingredientsName,
    required this.descriptions,
    required this.directions,
  });

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      name: map['name'] as String,
      rate: map['rate'] as String,
      image: map['image'] as String,
      kcal: map['kcal'] as String,
      time: map['time'] as String,
      ingredientsName: List<String>.from(
        map['ingredientsName'].map((e) => e.toString()),
      ),
      descriptions: List<String>.from(
        map['descriptions'].map((e) => e.toString()),
      ),
      directions: List<String>.from(
        map['directions'].map((e) => e.toString()),
      ),
    );
  }
}

extension RecipeXModel on RecipeModel {
  RecipeEntity toEntity() {
    return RecipeEntity(
      name: name,
      rate: rate,
      image: image,
      kcal: kcal,
      time: time,
      ingredientsName: ingredientsName,
      descriptions: descriptions,
      directions: directions,
    );
  }
}
