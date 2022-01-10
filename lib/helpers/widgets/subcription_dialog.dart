import 'package:amigos/helpers/bottom_sheets/further_subscription.dart';
import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/getplan_dialog.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/ui/dashboard/profiles_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionDialogBox extends StatefulWidget {
  const SubscriptionDialogBox({Key? key}) : super(key: key);

  @override
  _SubscriptionDialogBoxState createState() => _SubscriptionDialogBoxState();
}

class _SubscriptionDialogBoxState extends State<SubscriptionDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black.withOpacity(0.4),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width*0.9,
            height: Get.width*1.2,
            padding: EdgeInsets.symmetric(vertical: Get.width*0.05,horizontal: Get.width*0.05),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon:  Image.asset(
                      AppImages.close,
                      width: Get.width*0.06,
                      height: Get.width*0.06,
                      color: AppColors.geryLight,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                Container(
                  width: Get.width*0.3,
                  height: Get.width*0.25,
                  padding: EdgeInsets.symmetric(vertical: Get.height*0.012),
                  decoration: BoxDecoration(
                    gradient: AppColors.orangeGradientColor
                  ),
                  child: Image.asset(AppImages.splashLogo),
                ),
                SizedBox(
                  height: Get.width*0.1,
                ),
                Text(getTranslated(context, 'access_to')??"",
                  style: AppTextStyle.montserrat(
                      AppColors.shadedBlack,
                      Get.width*0.06,
                      FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: Get.width*0.04,
                ),
                Text(getTranslated(context, 'free_trial')??"",
                  style: AppTextStyle.montserrat(
                    AppColors.blackLite,
                    Get.width*0.04,
                    FontWeight.w400,
                  ),
                ),
                Text(getTranslated(context, 'after_trial_ends')??"",
                  style: AppTextStyle.montserrat(
                    AppColors.blackLite,
                    Get.width*0.04,
                    FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Get.width*0.04,
                ),
                AppButton(
                    buttonText: 'view_plans',
                    onpressed: (){
                      Get.dialog(
                        GetPlanDialogBox(func:(){Get.bottomSheet(FurtherSubscription());})
                      );
                    },
                    width: 450,
                    isWhite: false,
                ),
                SizedBox(
                  height: Get.width*0.02,
                ),
                Text(AppDummyData.mediumText,
                  style: AppTextStyle.montserrat(
                    AppColors.blackLite,
                    Get.width*0.035,
                    FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
