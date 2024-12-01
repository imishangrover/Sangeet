import 'package:flutter/material.dart';
import 'package:sangeet/common/widgets/appbar/app_bar.dart';
import 'package:sangeet/common/widgets/button/basic_app_button.dart';
import 'package:sangeet/core/configs/assets/app_vectors.dart';
import 'package:sangeet/data/models/auth/signin_user_req.dart';
import 'package:sangeet/domain/usecases/auth/signin.dart';
import 'package:sangeet/presentation/auth/pages/signup_page.dart';
import 'package:sangeet/presentation/home/pages/home.dart';
import 'package:sangeet/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  bool passwordVisibility = false;

  Future _saveSignInState() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isSignedIn', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signIntext(context),
      appBar: BasicAppBar(
        title: Image.asset(
          AppVectors.logo,
          height: 70,
          width: 70,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signInText(),
              const SizedBox(height: 10,),
              _support(),
              const SizedBox(height: 10,),
              _emailNameFild(context),
              const SizedBox(height: 20,),
              _passwordField(context),
              const SizedBox(height: 20,),
              BasicAppButton(
                onPressed: () async{
                  var result = await sl<SigninUseCase>().call(
                    params: SigninUserReq(
                      email: _email.text.toString(), 
                      password: _password.text.toString(),
                    )
                  );
                  result.fold(
                    (l){
                      var snackBar = SnackBar(content: Text(l));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    (r) async{
                      await _saveSignInState();
                      Navigator.pushAndRemoveUntil(
                        context, 
                        MaterialPageRoute(builder: (BuildContext context) => const HomePage()), 
                        (Route<dynamic> route) => false,
                      );
                    },
                  );
                },
                title: 'Sign In',
              ),
              const SizedBox(height: 20,),
              _forgotPassword(),
              const SizedBox(height: 20,),
              _or(),
              const SizedBox(height: 10,),
              _googleIcon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInText()
  {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _support()
  {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('If You Need Any Support'),
                //TODO add functionality to click here in form of textButton
                TextButton(
                  onPressed: (){},
                  child: const Text('Click Here',style: TextStyle(color: Color(0xff38B432)),
                  ))
              ],
            );
  }

  Widget _emailNameFild(BuildContext context)
  {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _passwordField(BuildContext context)
  {
    return TextField(
      controller: _password,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              passwordVisibility = !passwordVisibility;
            });
          },
          icon: Icon(passwordVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined)
        ),
        hintText: 'Password',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
      obscureText: !passwordVisibility,
      keyboardType: TextInputType.visiblePassword,
    );
  }

  Widget _forgotPassword()
  {
    // TODO Apply functionality 
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextButton(
          onPressed: () {},
          child: const Text('Forgot password')
        )
      )
    );
  }

  Widget _or()
  {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppVectors.line),
                Transform.translate(
                  offset: const Offset(0, -6),
                  child: const Text(
                    'Or',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Image.asset(AppVectors.line),
              ]
            );
  }

  Widget _googleIcon()
  {
    return IconButton(
      onPressed: (){}, 
      icon: Image.asset(AppVectors.google)
    );
  }

  Widget _signIntext(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Not A Member'),
          TextButton(
            onPressed: (){
              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(
                                  builder: (BuildContext context) => const SignupPage(),
                                )
                              );
            },
            child: const Text('Register Now')
          )
        ],
      ),
    );
  }
}