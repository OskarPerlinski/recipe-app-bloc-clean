import 'package:recipe_app/core/configs/constants/app_urls.dart';

class ImageDisplayHelper {

  static String generateRecipeImageURL(String title) {
    return AppUrls.recipeImage + title + AppUrls.alt;
  }
}