import 'package:flutter/material.dart';
import 'package:sangeet/common/widgets/appbar/app_bar.dart';
import 'package:sangeet/common/widgets/button/basic_app_button.dart';
import 'package:sangeet/core/configs/assets/app_vectors.dart';
import 'package:sangeet/data/models/auth/create_user_req.dart';
import 'package:sangeet/domain/usecases/auth/signup.dart';
import 'package:sangeet/presentation/auth/pages/signin_page.dart';
import 'package:sangeet/presentation/root/pages/root.dart';
import 'package:sangeet/service_locator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool passwordVisibility = false;
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
              _registerText(),
              const SizedBox(height: 10,),
              _support(),
              const SizedBox(height: 10,),
              _fullNameFild(context),
              const SizedBox(height: 20,),
              _eMailFild(context),
              const SizedBox(height: 20,),
              _passwordFild(context),
              const SizedBox(height: 20,),
              BasicAppButton(
                onPressed: () async{
                  var result = await sl<SignupUseCase>().call(
                    params: CreateUserReq(
                      fullName: _fullName.text.toString(), 
                      email: _email.text.toString(), 
                      password: _password.text.toString(),
                    )
                  );
                  result.fold(
                    (l){
                      var snackBar = SnackBar(content: Text(l));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    (r){
                      Navigator.pushAndRemoveUntil(
                        context, 
                        MaterialPageRoute(builder: (BuildContext context) => const RootPage()), 
                        (Route<dynamic> route) => false,
                      );
                    },
                  );
                },
                title: 'Create Account',
              ),
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

  Widget _registerText()
  {
    return const Text(
      'Register',
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

  Widget _fullNameFild(BuildContext context)
  {
    return TextField(
      controller: _fullName,
      decoration: const InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _eMailFild(BuildContext context)
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

  Widget _passwordFild(BuildContext context)
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
      onPressed: (){
        
      }, 
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
          const Text('Do you Have An Account?'),
          TextButton(
            onPressed: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SigninPage()
                )
              );
            },
            child: const Text('Sign In')
          )
        ],
      ),
    );
  }
}