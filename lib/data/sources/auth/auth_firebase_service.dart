import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sangeet/data/models/auth/create_user_req.dart';
import 'package:sangeet/data/models/auth/signin_user_req.dart';

abstract class AuthfirebaseService{

  Future<Either<String,String>> signin(SigninUserReq signinUserReq);

  Future<Either<String,String>> signup(CreateUserReq createUserReq);
}

class AuthFirebaseServiceImpl extends AuthfirebaseService{
  final FirebaseAuth _firebaseAuth;

  AuthFirebaseServiceImpl(this._firebaseAuth);
  @override

  //Signin method 

  Future<Either<String,String>> signin(SigninUserReq signinUserReq) async {
    try {
      // it provide the list of account existes in database
      final List<String> methods = await _firebaseAuth.fetchSignInMethodsForEmail(signinUserReq.email);

      if(methods.isNotEmpty)
      {
        // it haandels the error 
        return const Left('No account found for this email.');
      }

      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: signinUserReq.email, 
        password: signinUserReq.password 
      );
      // email verifiaction
      
      if (userCredential.user  != null && !userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification();
        return const Right('Signin is successful. A verification email has been sent.');
      }

      return const Right('Signin is successful');
      
    } on FirebaseAuthException catch (e) {

      String message = '';

      if(e.code == 'user-not-found')
      {
        message = 'Not user found for that email';
      }
      else if(e.code == 'wrong-password')
      {
        message = 'Wrong password provided for that email';
      }
      else
      {
        message = 'An error occurred while creating the account: ${e.code}';
      }

      return Left(message);
      
    }
    catch(e){
      return Left('An error occurred: $e');
    }
  }


  //signup method
  @override
  Future<Either<String,String>> signup(CreateUserReq createUserReq) async{
    try {
      // it provide the list of account existes in database
      final List<String> methods = await _firebaseAuth.fetchSignInMethodsForEmail(createUserReq.email);

      if(methods.isNotEmpty)
      {
        // it haandels the error 
        return const Left('Email already exists');
      }

      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: createUserReq.email, 
        password: createUserReq.password 
      );
      // email verifiaction
      
      // if (userCredential.user  != null && !userCredential.user!.emailVerified) {
      //   await userCredential.user!.sendEmailVerification();
      //   return const Right('Signup is successful. A verification email has been sent.');
      // }

      await FirebaseFirestore.instance.collection('Users').add(
        {
          'name' : createUserReq.fullName,
          'email' : userCredential.user?.email,
        },
      );

      return const Right('Signup is successful');
      
    } on FirebaseAuthException catch (e) {

      String message = '';

      if(e.code == 'weak-password')
      {
        message = 'The password is too weak';
      }
      else if(e.code == 'email-already-in-use')
      {
        message = 'Account already exist';
      }
      else
      {
        message = 'An error occurred while creating the account: ${e.code}';
      }

      return Left(message);
      
    }
    catch(e){
      return Left('An error occurred: $e');
    }
    
  }

}