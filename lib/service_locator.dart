import 'package:get_it/get_it.dart';
import 'package:sangeet/data/repository/auth/auth_repository_impl.dart';
import 'package:sangeet/data/sources/auth/auth_firebase_service.dart';
import 'package:sangeet/domain/repositry/auth/auth.dart';
import 'package:sangeet/domain/usecases/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{

  sl.registerSingleton<AuthfirebaseService>(
    AuthFirebaseServiceImpl()
  );

  sl.registerSingleton<AuthRepositry>(
    AuthRepositoryImpl()
  );

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );

}