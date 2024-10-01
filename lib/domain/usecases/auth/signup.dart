import 'package:dartz/dartz.dart';
import 'package:sangeet/core/usecase/usecase.dart';
import 'package:sangeet/data/models/auth/create_user_req.dart';
import 'package:sangeet/domain/repositry/auth/auth.dart';
import 'package:sangeet/service_locator.dart';

class SignupUseCase implements UseCase<Either,CreateUserReq>{
  @override
  Future<Either> call({CreateUserReq ? params}) {
    return sl<AuthRepositry>().signup(params!);
  }

}