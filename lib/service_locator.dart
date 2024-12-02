import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:sangeet/data/repository/auth/auth_repository_impl.dart';
import 'package:sangeet/data/repository/songs/songs_repositry_impl.dart';
import 'package:sangeet/data/sources/auth/auth_firebase_service.dart';
import 'package:sangeet/data/sources/songs/songs_firebase_service.dart';
import 'package:sangeet/domain/repositry/auth/auth.dart';
import 'package:sangeet/domain/repositry/songs/songs.dart';
import 'package:sangeet/domain/usecases/auth/signin.dart';
import 'package:sangeet/domain/usecases/auth/signup.dart';
import 'package:sangeet/domain/usecases/songs/get_new_songs.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{

  sl.registerSingleton<AuthfirebaseService>(
    AuthFirebaseServiceImpl(FirebaseAuth.instance)
  );

  sl.registerSingleton<SongsFirebaseService>(
    SongsFirebaseServiceImp()
  );

  sl.registerSingleton<AuthRepositry>(
    AuthRepositoryImpl()
  );

  sl.registerSingleton<SongsRepositry>(
    SongsRepositryImpl()
  );

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase()
  );

  sl.registerSingleton<GetNewSongsUseCase>(
    GetNewSongsUseCase()
  );

}