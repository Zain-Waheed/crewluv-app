import 'package:amigos/helpers/bottom_sheets/congratulation_bottomsheet.dart';
import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/ui/dashboard/dashboard.dart';
import 'package:amigos/ui/dashboard/settings_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FurtherSubscription extends StatefulWidget {

  @override
  _FurtherSubscriptionState createState() => _FurtherSubscriptionState();
}

class _FurtherSubscriptionState extends State<FurtherSubscription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
        color: AppColors.whiteColor,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.05),
        child: Column(
          children: [
            Container(
              width: Get.width*0.25,
              padding: EdgeInsets.symmetric(vertical: Get.width*0.008),
              margin: EdgeInsets.symmetric(vertical: Get.width*0.03),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.bottomSheetGrey
              ),

            ),
            Text(getTranslated(context, "app_store")??"",style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w700),),
            SizedBox(height: Get.height*0.05,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: Get.height*0.015),
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(AppImages.appLogoSmall),
                ),
                SizedBox(width: Get.width*0.05,),
                Column(
                  children: [
                    Text(getTranslated(context, 'membership')??'',style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w700),),
                    SizedBox(height: Get.width*0.01,),
                    Text(getTranslated(context, 'slogan')??'',style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),),
                  ],
                ),

              ],
            ),
            SizedBox(height: Get.height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                        Text("${getTranslated(context, 'policy')}",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),),
                        SizedBox(width: Get.width*0.05,),
                        Expanded(child: Text(AppDummyData.mediumText,style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),maxLines: 2,overflow: TextOverflow.ellipsis,)),


                     ],
            ),
            SizedBox(height: Get.height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("${getTranslated(context, 'account')}",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),),
                SizedBox(width: Get.width*0.05,),
                Center(child: Expanded(child: Text('charlesbrown@icloud.com',style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),maxLines: 2,overflow: TextOverflow.ellipsis,))),


              ],
            ),
            SizedBox(height: Get.height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("${getTranslated(context, 'time')}",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),),
                SizedBox(width: Get.width*0.05,),
                Center(child: Expanded(child: Text('Monthly',style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),maxLines: 2,overflow: TextOverflow.ellipsis,))),



              ],
            ),
            SizedBox(height: Get.height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("${getTranslated(context, 'price')}",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),),
                SizedBox(width: Get.width*0.05,),
                Center(child: Expanded(child: Text('\$x per month',style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),maxLines: 2,overflow: TextOverflow.ellipsis,))),
              ],
            ),
            SizedBox(height: Get.height*0.1,),
            AppButton(buttonText: 'subscribe_now', onpressed: (){
              Get.bottomSheet(const CongraulationBottomSheet(text: 'you_have_successfully',));
              Future.delayed(const Duration(seconds: 3),(){
                Get.to(
                  const SettingsScreen(),
                );
              },
              );
              }, width: Get.width, isWhite: false),
          ],
        ),
      ),
    );
  }
}
