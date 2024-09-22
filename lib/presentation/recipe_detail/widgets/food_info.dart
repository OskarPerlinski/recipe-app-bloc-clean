import 'package:flutter/material.dart';
import 'package:recipe_app/domain/recipe/entities/recipe.dart';

class FoodInfo extends StatelessWidget {
  final RecipeEntity recipeEntity;
  const FoodInfo({super.key, required this.recipeEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recipeEntity.name,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 2),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                '${recipeEntity.kcal}Kcal',
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 15),
              const Icon(
                Icons.circle,
                color: Colors.grey,
                size: 10,
              ),
              const SizedBox(width: 15),
              Text(
                '${recipeEntity.time}Min',
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange,),
              const SizedBox(width: 5),
              Text(
                recipeEntity.rate,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                '(20 reviews)',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
