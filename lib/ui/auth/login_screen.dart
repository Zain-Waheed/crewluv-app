import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/ui/auth/phone_screen.dart';
import 'package:amigos/ui/dashboard/terms_of_use.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? UserId = prefs.getString('isLogin');
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.orangeGradientColor,
        ),
        child: Column(
          children: [
            SizedBox(
              height: Get.width*0.2,
            ),
            Expanded(
              child: SizedBox(
                height: Get.width*0.8,
                child: Image.asset(AppImages.loginLogo),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width*0.07,vertical: Get.width*0.1,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(text: getTranslated(context, 'by_clicking')??"",
                            style: AppTextStyle.montserrat(AppColors.white, Get.width*0.04, FontWeight.w400),
                          ),

                          TextSpan(text: getTranslated(context, 'terms_conditions')??"",
                            style: GoogleFonts.montserrat(
                              fontSize:Get.width*0.04,
                              color:AppColors.white,
                              fontWeight:FontWeight.w600,
                              decoration: TextDecoration.underline,
                              height: 1.2,
                              letterSpacing: 1.0,
                            ),
                            recognizer: TapGestureRecognizer()..onTap= ()=> Get.to(()=>TermsOfUse(termsOfUse: true)),
                          ),

                          TextSpan(text: getTranslated(context, 'learn_how_we')??"",
                            style:GoogleFonts.montserrat(
                              fontSize:Get.width*0.04,
                              color:AppColors.white,
                              fontWeight:FontWeight.w600,
                              height: 1.2,
                              letterSpacing: 1.0,
                            ),
                          ),
                          TextSpan(text: getTranslated(context, 'privacy_policy2')??"",
                            recognizer: TapGestureRecognizer()..onTap= ()=> Get.to(()=>TermsOfUse(termsOfUse: false)),
                            style:GoogleFonts.montserrat(
                                fontSize:Get.width*0.04,
                                color:AppColors.white,
                                fontWeight:FontWeight.w600,
                                decoration: TextDecoration.underline,
                                height: 1.2 ,
                                letterSpacing: 1.0
                            ),
                          ),
                          TextSpan(text: '.',style:GoogleFonts.montserrat(
                            fontSize:Get.width*0.04,
                            color:AppColors.white,
                            fontWeight:FontWeight.w600,
                            height: 1.2,
                            letterSpacing: 1.0,
                          ),),
                        ]
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: Get.width*0.08,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAll(const PhoneNumberPicker());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: Get.width*0.04),
                      primary: AppColors.whiteLite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius
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
                  SizedBox(
                    height: Get.width*0.04,
                  ),
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
                  SizedBox(
                    height: Get.width*0.04,
                  ),
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
