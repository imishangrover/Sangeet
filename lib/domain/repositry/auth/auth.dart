import 'package:dartz/dartz.dart';
import 'package:sangeet/data/models/auth/create_user_req.dart';

abstract class AuthRepositry
{

Future<void> signin();

Future<Either> signup(CreateUserReq createUserReq);

}