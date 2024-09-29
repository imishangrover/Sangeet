import 'package:flutter/material.dart';
import 'package:sangeet/common/widgets/appbar/app_bar.dart';
import 'package:sangeet/common/widgets/button/basic_app_button.dart';
import 'package:sangeet/core/configs/assets/app_vectors.dart';
import 'package:sangeet/presentation/auth/pages/signup_page.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signInText(),
            const SizedBox(height: 10,),
            _support(),
            const SizedBox(height: 10,),
            _fullNameFild(context),
            const SizedBox(height: 20,),
            _passwordFild(context),
            const SizedBox(height: 20,),
            BasicAppButton(
              onPressed: (){},
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

  Widget _fullNameFild(BuildContext context)
  {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Enter Username or Email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      )
    );
  }


  Widget _passwordFild(BuildContext context)
  {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      )
    );
  }

  Widget _forgotPassword()
  {
    // TODO Apply functionality 
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text('Forgot password')
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
              Navigator.push(
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