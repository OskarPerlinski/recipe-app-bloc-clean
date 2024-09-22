import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/usecases/usecases.dart';
import 'package:recipe_app/domain/auth/repository/auth.dart';
import 'package:recipe_app/service_locator.dart';

class SendPasswordResetEmailUseCse implements Usecases<Either, String> {
  @override
  Future<Either> call({String ? params}) async {
    return sl<AuthRepository>().sendPasswordResetEmail(params!);
  }

}