import 'package:amigos/ui/auth/favorite_drinks_screen.dart';
import 'package:amigos/ui/dashboard/chatt_screen.dart';
import 'package:amigos/ui/dashboard/profile_detail_screen.dart';
import 'package:amigos/ui/intro/splash_logo_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({Key? key}) : super(key: key);

  @override
  _SplashScreeenState createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {

  void initState() {
    Future.delayed(Duration(seconds: 1),(){
      Get.off(
          ProfileDetail()
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
