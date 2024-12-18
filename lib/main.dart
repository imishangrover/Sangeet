import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sangeet/core/configs/theme/app_theme.dart';
import 'package:sangeet/firebase_options.dart';
import 'package:sangeet/presentation/choose_mode/block/theme_cubit.dart';
import 'package:sangeet/presentation/splash/pages/splash.dart';
import 'package:sangeet/service_locator.dart';

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory(),
    );
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
      
      await initializeDependencies();
      FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);
    runApp(const MainApp());
  }


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: mode,
              home: const SplashPage())
      ),
    );
  }
}
