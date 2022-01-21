import 'package:amigos/ui/auth/login_screen.dart';
import 'package:amigos/ui/intro/onboarding.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashLogoScreen extends StatefulWidget {
  const SplashLogoScreen({Key? key}) : super(key: key);

  @override
  _SplashLogoScreenState createState() => _SplashLogoScreenState();
}

class _SplashLogoScreenState extends State<SplashLogoScreen> with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  void initState() {
    Future.delayed(Duration(seconds: 3),()async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? isLogin = prefs.getString("isLogin");
      if(isLogin=='true'){
        Get.off(Login());
      }else
        {
          Get.off(OnBoarding());
        }
    },
    );
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          gradient: AppColors.orangeGradientColor,
        ),
        alignment: Alignment.center,
        child: ScaleTransition(
        scale: _animation,
        child:  Image.asset(AppImages.splashLogo, height: Get.height*0.3,width: Get.width*0.6,),
      ),
    ));



  }
}
