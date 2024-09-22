import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/common/widgets/recipe/recipe_card.dart';
import 'package:recipe_app/domain/recipe/entities/recipe.dart';
import 'package:recipe_app/presentation/home/bloc/recipe_ideas_display_cubit.dart';
import 'package:recipe_app/presentation/home/bloc/recipe_ideas_display_state.dart';

class QuickAndFast extends StatelessWidget {
  const QuickAndFast({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeIdeasDisplayCubit()..displayRecipe(),
      child: BlocBuilder<RecipeIdeasDisplayCubit, RecipeIdeasDisplayState>(
        builder: (context, state) {
          if (state is RecipeLoading) {
            return const CircularProgressIndicator();
          }
          if (state is RecipeLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _quickandfast(),
                const SizedBox(height: 10),
                _recipe(state.recipe),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _quickandfast() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'Quick and Fast',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    );
  }

  Widget _recipe(List<RecipeEntity> recipe) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Expanded(
        child: SizedBox(
          height: 1100,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return RecipeCard(
                recipeEntity: recipe[index],
              );
            },
            itemCount: recipe.length,
          ),
        ),
      ),
    );
  }
}
