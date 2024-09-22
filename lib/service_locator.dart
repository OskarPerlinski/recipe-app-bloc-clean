import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/auth/repository/auth_repository_impl.dart';
import 'package:recipe_app/data/auth/source/auth_firebase_service.dart';
import 'package:recipe_app/data/recipe/repository/recipe.dart';
import 'package:recipe_app/data/recipe/source/recipe_firebase_service.dart';
import 'package:recipe_app/domain/auth/repository/auth.dart';
import 'package:recipe_app/domain/auth/usecases/send_password_reset_email.dart';
import 'package:recipe_app/domain/auth/usecases/signin.dart';
import 'package:recipe_app/domain/auth/usecases/signup.dart';
import 'package:recipe_app/domain/recipe/repository/recipe.dart';
import 'package:recipe_app/domain/recipe/usecases/get_recipe.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {


  //Service
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );

  sl.registerSingleton<RecipeFirebaseService>(
    RecipeFirebaseServiceImpl()
  );


  //Repositories
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  sl.registerSingleton<RecipeRepository>(
    RecipeRepositoryImpl()
  );

  

  //Usecases
  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase()
  );

  sl.registerSingleton<SendPasswordResetEmailUseCse>(
    SendPasswordResetEmailUseCse()
  );

  sl.registerSingleton<GetRecipeUseCase>(
    GetRecipeUseCase()
  );


}