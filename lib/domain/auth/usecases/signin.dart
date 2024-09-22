import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/usecases/usecases.dart';
import 'package:recipe_app/data/auth/models/user_signin_req.dart';
import 'package:recipe_app/domain/auth/repository/auth.dart';
import 'package:recipe_app/service_locator.dart';

class SigninUseCase implements Usecases<Either,UserSigninReq> {
  @override
  Future<Either> call({UserSigninReq ? params}) async {
    return sl<AuthRepository>().signin(params!);
  }

}