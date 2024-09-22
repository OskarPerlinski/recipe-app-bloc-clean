import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/usecases/usecases.dart';
import 'package:recipe_app/domain/recipe/repository/recipe.dart';
import 'package:recipe_app/service_locator.dart';

class GetRecipeUseCase implements Usecases<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<RecipeRepository>().getQuickAndEasy();
  }

}