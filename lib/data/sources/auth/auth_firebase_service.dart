import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sangeet/data/models/auth/create_user_req.dart';

abstract class AuthfirebaseService{

  Future<void> signin();

  Future<Either> signup(CreateUserReq createUserReq);
}

class AuthFirebaseServiceImpl extends AuthfirebaseService{
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async{
    try {

      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email, 
        password: createUserReq.password 
      );
      return const Right('Signup is successfull');
      
    } on FirebaseAuthException catch (e) {

      String message = '';

      if(e.code == 'week-password')
      {
        message = 'The password is too week';
      }
      else if(e.code == 'email-already-in-use')
      {
        message = 'Account already exist';
      }

      return Left(message);
      
    }
  }

}