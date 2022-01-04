import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder:(context,dashPro,_)
    {
      return Container(
        height: Get.height*0.7,
        padding: EdgeInsets.symmetric(vertical: Get.width*0.002,horizontal: Get.width*0.03),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: AppColors.whiteColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: Get.width*0.25,
                  padding: EdgeInsets.symmetric(vertical: Get.width*0.008),
                  margin: EdgeInsets.symmetric(vertical: Get.width*0.03),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.bottomSheetGrey
                  ),
                ),
              ),
              Center(child: Image.asset(AppImages.newPassword,scale: 3,)),
              SizedBox(height: Get.height*0.002,),
              Center(child: Text(getTranslated(context, "change_password")??"",style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w700),)),
              SizedBox(height: Get.height*0.01,),
              Center(child: Text(getTranslated(context, "must_include")??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w400),textAlign: TextAlign.center,),),
              SizedBox(height: Get.height*0.03,),
              Text(getTranslated(context, "old_password")??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w400),),
              SizedBox(height: Get.height*0.01,),
              TextFormField(
                decoration: AppInputDecoration.lessCircularDecoration(null,'enter_password',Image.asset(AppImages.eye,scale: 3,), AppColors.silverWhite),

              ),
              SizedBox(height: Get.height*0.02,),
              Text(getTranslated(context, "new_password")??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w400),),
              SizedBox(height: Get.height*0.01,),
              TextFormField(
                decoration: AppInputDecoration.lessCircularDecoration(null,'enter_password',Image.asset(AppImages.eye,scale: 3,),AppColors.silverWhite),
              ),
              SizedBox(height: Get.height*0.02),
              TextFormField(
                decoration: AppInputDecoration.lessCircularDecoration(null,'confirm_password',Image.asset(AppImages.eye,scale: 3,),AppColors.silverWhite),

              ),
              SizedBox(height: Get.height*0.02,),
              Center(child: AppButton(buttonText: 'save_changes', onpressed: (){}, width: Get.width*0.9, isWhite: false)),
            ],
          ),
        ),

      );
    });

  }
}
