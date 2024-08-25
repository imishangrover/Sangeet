import 'package:flutter/material.dart';
import 'package:sangeet/common/widgets/button/basic_app_button.dart';
import 'package:sangeet/core/configs/assets/app_images.dart';
import 'package:sangeet/core/configs/assets/app_vectors.dart';
import 'package:sangeet/core/configs/theme/app_colors.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.intro_image),
              )
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

                const Text('Enjoy listening to music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),

                const SizedBox(height: 21),

                const Text('Music is a universal language that connects people, evokes emotions, and transcends cultural boundaries.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.grey,
                  ),
                  textAlign:TextAlign.center,
                ),

                const SizedBox(height: 21,),

                BasicAppButton(
                  onPressed: (){}, 
                  title: 'Get Started',
                )
              ],
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          )
        ],
      ),
    );
  }
}