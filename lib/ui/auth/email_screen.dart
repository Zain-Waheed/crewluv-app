import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/ui/auth/fullname_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:amigos/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'otp_screen.dart';
class EnterEmail extends StatefulWidget {
  const EnterEmail({Key? key}) : super(key: key);

  @override
  _EnterEmailState createState() => _EnterEmailState();
}

class _EnterEmailState extends State<EnterEmail> {

  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isChecked=true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.width * 0.17),
        child: CustomAppBar(
            function: () {
              //Get.to(() => const PhoneNumber());
              Get.back();
            },
            backButton: false,
            title: 'complete_profile'),
      ),
      bottomNavigationBar: Container(
        height: Get.width * 0.2,
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.07, vertical: Get.width * 0.03),
        child: AppButton(
          isWhite: false,
          width: Get.width * 0.6,
          buttonText: 'further',
          onpressed: () {
            if(formKey.currentState!.validate())
            {
              Get.to(() => const EnterFullName());
            }

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
                height: Get.width * 0.1,
              ),

              Row(
                children: [
                  Expanded(
                    child: LinearPercentIndicator(
                      fillColor: AppColors.grey,
                      percent: 0.1,
                      lineHeight: Get.width*0.04,
                      linearGradient: AppColors.buttonGradientColor,

                    ),
                  ),
                  SizedBox(width: Get.width*0.01,),
                  Text('10%',style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.04, FontWeight.w300),)
                ],

              ),
              SizedBox(
                height: Get.width * 0.1,
              ),
              Text(
                getTranslated(context, 'enter_email_address') ?? "",
                style: AppTextStyle.montserrat(
                    AppColors.shadedBlack, Get.width * 0.06, FontWeight.w600),
              ),
              SizedBox(
                height: Get.width * 0.05,
              ),
              Text(
                getTranslated(context, 'confirm_email') ?? "",
                style: AppTextStyle.montserrat(
                    AppColors.lightGrey, Get.width * 0.035, FontWeight.w400),
              ),
              SizedBox(height: Get.width * 0.15),
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailController,
                  validator: (value)=> FieldValidator.validateEmail(emailController.text),
                  decoration: AppInputDecoration.circularFieldDecoration(null, 'enter_email', Image.asset(AppImages.emailIcon,),),
                )
              ),
              SizedBox(height: Get.width * 0.15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: AppColors.themeColor,
                    onChanged: (value){ isChecked=value!; setState(() {

                  });},
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  ),
                  Expanded(child: Text(getTranslated(context, "like_to_update")??"",style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.027, FontWeight.w400),)),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
