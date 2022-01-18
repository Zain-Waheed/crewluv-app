import 'package:amigos/ui/intro/splash_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WhiteScreen extends StatefulWidget {
  const WhiteScreen({Key? key}) : super(key: key);

  @override
  _WhiteScreenState createState() => _WhiteScreenState();
}

class _WhiteScreenState extends State<WhiteScreen> {


  void initState() {
    Future.delayed(const Duration(seconds: 1),(){
      Get.off(()=>const SplashScreen());
    },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: AppColors.whiteColor,
    );
  }
}
