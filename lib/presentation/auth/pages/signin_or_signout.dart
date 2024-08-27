import 'package:flutter/material.dart';
import 'package:sangeet/common/helper/is_dark_mode.dart';
import 'package:sangeet/common/widgets/appbar/app_bar.dart';
import 'package:sangeet/common/widgets/button/basic_app_button.dart';
import 'package:sangeet/core/configs/assets/app_images.dart';
import 'package:sangeet/core/configs/assets/app_vectors.dart';
import 'package:sangeet/core/configs/theme/app_colors.dart';
import 'package:sangeet/presentation/choose_mode/pages/choose_mode.dart';

class SigninOrSignout extends StatelessWidget {
  const SigninOrSignout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          
          Container(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.auth_bg),
          ),
          
          Container(
            alignment: Alignment.topRight,
            child: Image.asset(AppVectors.top_pattern),
          ),

          Container(
            alignment: Alignment.bottomRight,
            child: Image.asset(AppVectors.botterm_pattern),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset(AppVectors.logo),
                    ),
                  ),

                  //const SizedBox(height: 1,),            
            
                  Text('Enjoy listening to music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: context.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
            
                  const SizedBox(height: 10),
            
                  const Text('Music is a universal language that connects people, evokes emotions, and transcends cultural boundaries.',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.grey,
                    ),
                    textAlign:TextAlign.center,
                  ),
            
                  const SizedBox(height: 21,),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicAppButton(
                          onPressed: (){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (BuildContext context) => const ChooseModePage(),
                              )
                            );
                          }, 
                          title: 'Register',
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(onPressed: (){}, 
                          child: Text('Sign In',
                            style: TextStyle(
                              color: context.isDarkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
          )
        ],
      ),
    );
  }
}