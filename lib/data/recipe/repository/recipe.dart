import 'package:dartz/dartz.dart';
import 'package:recipe_app/data/recipe/models/recipe.dart';
import 'package:recipe_app/data/recipe/source/recipe_firebase_service.dart';
import 'package:recipe_app/domain/recipe/repository/recipe.dart';
import 'package:recipe_app/service_locator.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  @override
  Future<Either> getQuickAndEasy() async {
    var returnedData = await sl<RecipeFirebaseService>().getQuickAndEasy();
    return returnedData.fold(
      (error){
        return Left(error);
      },
      (data){
        return Right(
          List.from(data).map((e) => RecipeModel.fromMap(e).toEntity()).toList()
        );
      },
    );
  }
}
