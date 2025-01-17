import 'package:amigos/helpers/widgets/getplan_dialog.dart';
import 'package:amigos/helpers/widgets/ticket_dialog.dart';
import 'package:amigos/ui/auth/complete_profile_screen.dart';
import 'package:amigos/ui/auth/favorite_drinks_screen.dart';
import 'package:amigos/ui/dashboard/crew_details.dart';
import 'package:amigos/ui/dashboard/chat_details.dart';
import 'package:amigos/ui/dashboard/create_event.dart';
import 'package:amigos/ui/dashboard/dashboard.dart';
import 'package:amigos/ui/dashboard/event_details.dart';
import 'package:amigos/ui/dashboard/group_chat_screen.dart';
import 'package:amigos/ui/dashboard/home_screen.dart';
import 'package:amigos/ui/dashboard/new_crew.dart';
import 'package:amigos/ui/dashboard/profile_detail_screen.dart';
import 'package:amigos/ui/dashboard/profile_screen.dart';
import 'package:amigos/ui/dashboard/profiles_screen.dart';
import 'package:amigos/ui/dashboard/settings_screen.dart';
import 'package:amigos/ui/intro/splash_logo_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    Future.delayed(const Duration(seconds: 1),(){
     Get.off(()=>const SplashLogoScreen());
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
