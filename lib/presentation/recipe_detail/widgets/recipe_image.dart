import 'package:flutter/material.dart';
import 'package:recipe_app/common/helper/images/image_display.dart';
import 'package:recipe_app/domain/recipe/entities/recipe.dart';

class RecipeImage extends StatelessWidget {
  final RecipeEntity recipeEntity;
  const RecipeImage({
    super.key,
    required this.recipeEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                ImageDisplayHelper.generateRecipeImageURL(recipeEntity.image),
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 10,
          child: GestureDetector( 
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child:  Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
