import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/ui/auth/phone_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.orangeGradientColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(AppImages.loginLogo , scale: 5,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width*0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(text: getTranslated(context, 'by_clicking')??"",
                            style: AppTextStyle.montserrat(AppColors.white, Get.width*0.04, FontWeight.w400),
                          ),
                          TextSpan(text: getTranslated(context, 'terms_conditions')??"",
                            style: AppTextStyle.montserrat(AppColors.white, Get.width*0.04, FontWeight.w600),
                          ),
                          TextSpan(text: getTranslated(context, 'learn_how_we')??"",
                            style: AppTextStyle.montserrat(AppColors.white, Get.width*0.04, FontWeight.w400),
                          ),
                          TextSpan(text: getTranslated(context, 'privacy_policy')??"",
                            style: AppTextStyle.montserrat(AppColors.white, Get.width*0.04, FontWeight.w600),
                          ),
                        ]
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Get.width*0.06,),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(PhoneNumber());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: Get.width*0.04),
                      primary: AppColors.whiteLite,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius
                            .circular(27.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: Get.width*0.04,
                        ),
                        Image.asset(AppImages.smartPhone,width: Get.width*0.06,height: Get.width*0.06,),
                        SizedBox(
                          width: Get.width*0.09,
                        ),
                        Text(
                          getTranslated(context, 'login_with_number')??"",
                          style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.width*0.04,),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => SelectCountary2()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: Get.width*0.04),
                      primary: AppColors.whiteLite,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius
                            .circular(27.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: Get.width*0.04,
                        ),
                        Image.asset(AppImages.google,width: Get.width*0.06,height: Get.width*0.06,),
                        SizedBox(
                          width: Get.width*0.09,
                        ),
                        Text(
                          getTranslated(context, 'login_with_google')??"",
                          style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.width*0.04,),
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: Get.width*0.04),
                      primary: AppColors.whiteLite,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius
                            .circular(27.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: Get.width*0.04,
                        ),
                        Image.asset(AppImages.facebook,width: Get.width*0.06,height: Get.width*0.06,),
                        SizedBox(
                          width: Get.width*0.09,
                        ),
                        Text(
                          getTranslated(context, 'continue_with_facebook')??"",
                          style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
