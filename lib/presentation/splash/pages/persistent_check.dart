import 'package:flutter/material.dart';
import 'package:sangeet/presentation/home/pages/home.dart';
import 'package:sangeet/presentation/intro/pages/get_started.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistentCheck extends StatelessWidget {
  const PersistentCheck({super.key});

  Future<bool> _checkSignedInState() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isSignedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkSignedInState(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        if(snapshot.data == true){
          return const HomePage();
        }
        else{
          return const GetStartedPage();
        }
      }
    );
  }
}