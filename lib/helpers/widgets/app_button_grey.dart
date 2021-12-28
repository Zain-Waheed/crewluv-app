import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AppButtonGrey extends StatefulWidget {
  const AppButtonGrey({Key? key}) : super(key: key);

  @override
  _AppButtonGreyState createState() => _AppButtonGreyState();
}

class _AppButtonGreyState extends State<AppButtonGrey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          minimumSize: MaterialStateProperty.all(Size(400, 50)),
          backgroundColor: MaterialStateProperty.all(AppColors.solidGrey),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed:null,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Text(
            getTranslated(context, "request_otp")??"",
            style: AppTextStyle.montserrat(AppColors.whiteColor, Get.width*0.04, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
