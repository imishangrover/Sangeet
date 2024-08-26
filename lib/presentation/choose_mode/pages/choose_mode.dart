import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sangeet/common/widgets/button/basic_app_button.dart';
import 'package:sangeet/core/configs/assets/app_images.dart';
import 'package:sangeet/core/configs/assets/app_vectors.dart';
import 'package:sangeet/core/configs/theme/app_colors.dart';
import 'package:sangeet/presentation/choose_mode/block/theme_cubit.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.choose_mode_bg),
              )
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40
            ),
            child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 100,
                      width: 150,
                      child: Image.asset(AppVectors.logo),
                    ),
                  ),
            
                  const Spacer(),
            
                  const Text('Choose Mode',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
            
                  const SizedBox(height: 41),
            
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                               context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                            },
                            child: ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,                              
                                    color: const Color(0xff30393C).withOpacity(0.5),
                                  ),
                                  child: Image.asset(AppVectors.moon),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          const Text('Dark Mode',
                            style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.w500, fontSize: 17)
                          )
                        ],
                      ),

                      const SizedBox(width: 40,),

                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                               context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                            },
                            child: ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,                              
                                    color: const Color(0xff30393C).withOpacity(0.5),
                                  ),
                                  child: Image.asset(AppVectors.sun),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          const Text('Light Mode',
                            style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.w500, fontSize: 17)
                          )
                        ],
                      ),
                    ],
                  ),
            
                  const SizedBox(height: 50,),
            
                  BasicAppButton(
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (BuildContext context) => const ChooseModePage(),
                        )
                      );
                    }, 
                    title: 'Continue',
                  )
                ],
              ),
          ),
        ],
      ),
    );
  }
}