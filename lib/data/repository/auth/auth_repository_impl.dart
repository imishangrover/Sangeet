import 'package:dartz/dartz.dart';
import 'package:sangeet/data/models/auth/create_user_req.dart';
import 'package:sangeet/data/sources/auth/auth_firebase_service.dart';
import 'package:sangeet/domain/repositry/auth/auth.dart';
import 'package:sangeet/service_locator.dart';

class AuthRepositoryImpl extends AuthRepositry
{
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthfirebaseService>().signup(createUserReq);
  }

}