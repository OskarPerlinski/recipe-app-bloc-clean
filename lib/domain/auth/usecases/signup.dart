import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/usecases/usecases.dart';
import 'package:recipe_app/data/auth/models/user_creation_req.dart';
import 'package:recipe_app/domain/auth/repository/auth.dart';
import 'package:recipe_app/service_locator.dart';

class SignupUseCase implements Usecases<Either,UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq ? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }

}