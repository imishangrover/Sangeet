import 'package:dartz/dartz.dart';
import 'package:sangeet/core/usecase/usecase.dart';
import 'package:sangeet/data/models/auth/signin_user_req.dart';
import 'package:sangeet/domain/repositry/auth/auth.dart';
import 'package:sangeet/service_locator.dart';

class SigninUseCase implements UseCase<Either,SigninUserReq>{
  @override
  Future<Either> call({SigninUserReq ? params}) {
    return sl<AuthRepositry>().signin(params!);
  }

}