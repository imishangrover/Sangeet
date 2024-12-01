import 'package:flutter/material.dart';
import 'package:sangeet/core/configs/assets/app_vectors.dart';
import 'package:sangeet/presentation/splash/pages/persistent_check.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppVectors.logo)
      ),
    );
  }

  Future<void> redirect() async{
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>const PersistentCheck()));
  }
}