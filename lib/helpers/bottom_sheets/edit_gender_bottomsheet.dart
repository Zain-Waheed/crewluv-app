import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/edit_profile.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EditGender extends StatefulWidget {
  const EditGender({Key? key}) : super(key: key);

  @override
  _EditGenderState createState() => _EditGenderState();
}

class _EditGenderState extends State<EditGender> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder:(context,dashPro,_)
    {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: AppColors.whiteColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            SizedBox(height: Get.width*0.01,),
            Text(getTranslated(context, "edit_gender")??"",style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w700),),
            SizedBox(height: Get.width*0.1,),

            GestureDetector(
              onTap: (){
                dashPro.gender=1;
                setState(() {

                });
              },
              child: Container(
                height: Get.width*0.17,
                width: Get.width*0.9,
                decoration: BoxDecoration(
                  color: AppColors.silverWhite,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color:dashPro.gender!=1?AppColors.genderBorder:AppColors.themeColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left:Get.width*0.06),
                      child: Center(child: Image.asset(AppImages.maleIcon,scale: 3,)),
                    ),
                    Text(getTranslated(context, 'male')??"",style: AppTextStyle.montserrat(dashPro.gender==1?AppColors.themeColor:AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),textAlign: TextAlign.center,),
                    Image.asset(AppImages.maleIcon,scale: 3,color: Colors.transparent,),

                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                dashPro.gender=2;
                setState(() {
                });
              },
              child: Container(
                height: Get.width*0.17,
                width: Get.width*0.9,
                margin: EdgeInsets.symmetric(vertical: Get.width*0.03),
                decoration: BoxDecoration(
                  color: AppColors.silverWhite,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color:dashPro.gender!=2?AppColors.genderBorder:AppColors.themeColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left:Get.width*0.06),
                      child: Image.asset(AppImages.femaleIcon,scale: 3,),
                    ),
                    Text(getTranslated(context, 'female')??"",style: AppTextStyle.montserrat(dashPro.gender==2?AppColors.themeColor:AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),),
                    Image.asset(AppImages.femaleIcon,scale: 3, color: Colors.transparent,),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                dashPro.gender=3;
                setState(() {
                });
              },
              child: Container(
                height: Get.width*0.17,
                width: Get.width*0.9,
                decoration: BoxDecoration(
                  color: AppColors.silverWhite,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color:dashPro.gender!=3?AppColors.genderBorder:AppColors.themeColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left:Get.width*0.06),
                      child: Image.asset(AppImages.othersIcon,scale: 3,),
                    ),
                    Text(getTranslated(context, "can't decide")??"",style: AppTextStyle.montserrat(dashPro.gender==3?AppColors.themeColor:AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),),
                    Image.asset(AppImages.othersIcon,scale: 3,color: Colors.transparent,),
                  ],
                ),
              ),
            ),
          SizedBox(height: Get.width*0.1,),
         AppButton(buttonText: 'save_changes', onpressed: (){

           Get.back();
         }, width: Get.width*0.9, isWhite: false),
            SizedBox(height: Get.width*0.05 ,),
          ],
        ),

      );
  });
  }
}
