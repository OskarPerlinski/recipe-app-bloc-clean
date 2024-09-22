import 'package:recipe_app/domain/recipe/entities/recipe.dart';

abstract class RecipeIdeasDisplayState {}

class RecipeLoading extends RecipeIdeasDisplayState{}

class RecipeLoaded extends RecipeIdeasDisplayState{
  List<RecipeEntity> recipe;
  RecipeLoaded({required this.recipe});
}

class LoadRecipeFailure extends RecipeIdeasDisplayState{}