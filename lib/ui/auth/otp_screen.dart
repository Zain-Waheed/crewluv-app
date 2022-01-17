import 'dart:async';

import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/app_button_grey.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/ui/auth/complete_profile_screen.dart';
import 'package:amigos/ui/auth/phone_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:amigos/utils/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpText;
  TextEditingController otpController = TextEditingController();
  int counter = 60;
  bool resend = false;
  final formKey = GlobalKey<FormState>();
  bool greyButton=true;
  @override
  void initState() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(
        oneSec,
            (Timer myTimer) {
          if (counter == 0) {
            myTimer.cancel();
            resend=true;
            counter=59;

          }
          else {
            counter--;
          }
          setState(() {
          });
        });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Get.width * 0.17),
          child: CustomAppBar(
              function: () {
                Get.to(() => const PhoneNumber());
              },
              backButton: true,
              title: 'otp'),
        ),
        bottomNavigationBar: Container(
          height: Get.width * 0.2,
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.07, vertical: Get.width * 0.03),
          child: greyButton==true? AppButtonGrey('verify'):AppButton(
            isWhite: false,
            width: Get.width * 0.6,
            buttonText: 'verify',
            onpressed: () {
              Get.to(() => const CompleteProfileScreen());
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.width * 0.2,
                ),
                Text(
                  getTranslated(context, 'enter_verification_code') ?? "",
                  style: AppTextStyle.montserrat(
                      AppColors.shadedBlack, Get.width * 0.07, FontWeight.w600),
                ),
                SizedBox(
                  height: Get.width * 0.05,
                ),
                Text(
                  getTranslated(context, 'code_sent') ?? "",
                  style: AppTextStyle.montserrat(
                      AppColors.lightGrey, Get.width * 0.035, FontWeight.w400),
                ),
                SizedBox(height: Get.width * 0.1),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: PinCodeTextField(
                    appContext: context,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    boxShadows: [
                      BoxShadow(
                          color: AppColors.black.withOpacity(0.2), offset: Offset(0, 4), blurRadius: 5.0)
                    ],
                    controller: otpController,
                    textStyle: AppTextStyle.montserrat(AppColors.themeColor, Get.width * 0.06, FontWeight.w500),
                    length: 6,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    enableActiveFill: true,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.circle,
                        inactiveColor: AppColors.whiteColor,
                        activeColor: AppColors.whiteColor,
                        selectedColor: AppColors.themeColor,
                        activeFillColor: AppColors.whiteColor,
                        inactiveFillColor: AppColors.whiteColor,
                        disabledColor: AppColors.themeColor,
                        errorBorderColor: AppColors.lightGrey,
                        selectedFillColor: AppColors.whiteColor,
                        borderWidth: 0.2,
                        fieldHeight: Get.width * .12,
                        fieldWidth: Get.width * 0.12,
                        fieldOuterPadding:
                            EdgeInsets.only(right: Get.width * 0.012)),
                    animationDuration: const Duration(milliseconds: 300),
                    //  backgroundColor: Colors.white,
                    validator: (value) =>
                        FieldValidator.validateOTP(otpController.text),
                    onCompleted: (value)
                    {
                      setState(() {
                        greyButton=false;
                      });
                    },
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        otpText = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: Get.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getTranslated(context, "didn't_get_the_code") ?? "",
                      style: AppTextStyle.montserrat(
                          AppColors.shadedBlack, Get.width * 0.04, FontWeight.w400),
                    ),
                    GestureDetector(
                      onTap: (){

                        if(resend==true)
                        {
                          otpController.clear();
                          resend=false;
                          const oneSec = const Duration(seconds: 1);
                          Timer.periodic(
                              oneSec,
                                  (Timer myTimer) {
                                if (counter == 0) {
                                  myTimer.cancel();
                                  resend=true;
                                  counter=59;
                                }
                                else {
                                  counter--;

                                }
                                setState(() {

                                });
                              });

                        }
                      },
                      child: Text(resend==true?getTranslated(context, "resend")??"": counter.toString(),style: AppTextStyle.poppins(AppColors.black, Get.width*.04, FontWeight.w500),),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
