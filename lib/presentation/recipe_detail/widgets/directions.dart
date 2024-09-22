import 'package:flutter/material.dart';
import 'package:recipe_app/domain/recipe/entities/recipe.dart';

class Directions extends StatelessWidget {
  final RecipeEntity recipeEntity;
  const Directions({super.key, required this.recipeEntity});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Directions :',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              recipeEntity.directions[0],
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              recipeEntity.descriptions[0],
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              recipeEntity.directions[1],
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 17
              ),
            ),
            const SizedBox(height: 10),
            Text(
              recipeEntity.descriptions[1],
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
