import 'package:amigos/ui/intro/onboarding.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SplashLogoScreen extends StatefulWidget {
  const SplashLogoScreen({Key? key}) : super(key: key);

  @override
  _SplashLogoScreenState createState() => _SplashLogoScreenState();
}

class _SplashLogoScreenState extends State<SplashLogoScreen> {
  void initState() {
    Future.delayed(Duration(seconds: 3),(){

      Get.off(
          OnBoarding()
      );
    },
    );
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
        gradient: AppColors.orangeGradientColor,
      ),
      alignment: Alignment.center,
      child:Image.asset(AppImages.splashLogo, height: Get.height*0.3,width: Get.width*0.6,),
    );
  }
}
