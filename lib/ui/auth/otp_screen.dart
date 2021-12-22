import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/ui/auth/email_screen.dart';
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
  bool resend = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: AppButton(
          isWhite: false,
          width: Get.width * 0.6,
          buttonText: 'verify',
          onpressed: () {
            // if(formKey.currentState!.validate())
            //   {
            //
            //   }
            Get.to(() => const EnterEmail());

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
                      activeColor: AppColors.lightGrey,
                      selectedColor: AppColors.whiteColor,
                      activeFillColor: AppColors.whiteColor,
                      inactiveFillColor: AppColors.whiteColor,
                      disabledColor: AppColors.whiteColor,
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
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      otpText = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
