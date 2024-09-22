import 'package:bloc/bloc.dart';
import 'package:recipe_app/domain/recipe/usecases/get_recipe.dart';
import 'package:recipe_app/presentation/home/bloc/recipe_ideas_display_state.dart';
import 'package:recipe_app/service_locator.dart';

class RecipeIdeasDisplayCubit extends Cubit<RecipeIdeasDisplayState> {
  RecipeIdeasDisplayCubit() : super(RecipeLoading());

  void displayRecipe() async {
    var returnedData = await sl<GetRecipeUseCase>().call();
    returnedData.fold(
      (error){
        emit(
          LoadRecipeFailure()
        );
      },
      (data){
        emit(
          RecipeLoaded(recipe: data)
        );
      },
    );
  }
}
