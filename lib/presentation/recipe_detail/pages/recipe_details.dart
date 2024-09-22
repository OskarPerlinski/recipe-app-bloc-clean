import 'package:flutter/material.dart';
import 'package:recipe_app/domain/recipe/entities/recipe.dart';
import 'package:recipe_app/presentation/recipe_detail/widgets/directions.dart';
import 'package:recipe_app/presentation/recipe_detail/widgets/food_info.dart';
import 'package:recipe_app/presentation/recipe_detail/widgets/ingredients.dart';
import 'package:recipe_app/presentation/recipe_detail/widgets/recipe_image.dart';

class RecipeDetailsPage extends StatelessWidget {
  final RecipeEntity recipeEntity;
  const RecipeDetailsPage({super.key, required this.recipeEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RecipeImage(recipeEntity: recipeEntity),
            const SizedBox(height: 20),
            FoodInfo(recipeEntity: recipeEntity),
            const SizedBox(height: 20),
            Ingredients(recipeEntity: recipeEntity),
            const SizedBox(height: 20),
            Directions(recipeEntity: recipeEntity,)
          ],
        ),
      ),
    );
  }
}
