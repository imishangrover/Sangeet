import 'package:dartz/dartz.dart';
import 'package:sangeet/data/models/auth/create_user_req.dart';
import 'package:sangeet/data/models/auth/signin_user_req.dart';

abstract class AuthRepositry
{

Future<Either> signin(SigninUserReq signinUserReq);

Future<Either> signup(CreateUserReq createUserReq);

}