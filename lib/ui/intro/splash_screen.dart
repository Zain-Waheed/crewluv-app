import 'package:amigos/ui/auth/favorite_drinks_screen.dart';
import 'package:amigos/ui/dashboard/chat_box_screen.dart';
import 'package:amigos/ui/dashboard/dashboard.dart';
import 'package:amigos/ui/dashboard/home_screen.dart';
import 'package:amigos/ui/dashboard/new_crew.dart';
import 'package:amigos/ui/dashboard/profile_detail_screen.dart';
import 'package:amigos/ui/dashboard/profiles_screen.dart';
import 'package:amigos/ui/dashboard/settings_screen.dart';
import 'package:amigos/ui/intro/splash_logo_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({Key? key}) : super(key: key);

  @override
  _SplashScreeenState createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {

  void initState() {
    Future.delayed(const Duration(seconds: 1),(){
      Get.off(
          const SplashLogoScreen()
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
    );
  }
}
