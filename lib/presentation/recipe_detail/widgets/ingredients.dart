import 'package:flutter/material.dart';
import 'package:recipe_app/domain/recipe/entities/recipe.dart';

class Ingredients extends StatelessWidget {
  final RecipeEntity recipeEntity;
  const Ingredients({super.key, required this.recipeEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Ingredients :',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '- ${recipeEntity.ingredientsName[0]}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          Text(
            '- ${recipeEntity.ingredientsName[1]}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          Text(
            '- ${recipeEntity.ingredientsName[2]}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          Text(
            '- ${recipeEntity.ingredientsName[3]}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
