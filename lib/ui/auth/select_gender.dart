import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


class SelectGender extends StatefulWidget {
  const SelectGender({Key? key}) : super(key: key);

  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context,dashPro,_)
    {
      return Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(Get.width * 0.17),
        //   child: CustomAppBar(
        //       function: () {
        //         Get.back();
        //       },
        //       backButton: true,
        //       title: 'complete_profile'),
        // ),
        // bottomNavigationBar: Container(
        //   height: Get.width * 0.2,
        //   padding: EdgeInsets.symmetric(
        //       horizontal: Get.width * 0.07, vertical: Get.width * 0.03),
        //   child: AppButton(
        //     isWhite: false,
        //     width: Get.width * 0.6,
        //     buttonText: 'further',
        //     onpressed: () {
        //
        //
        //     },
        //   ),
        // ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.width * 0.1,
            ),
            Text(
              getTranslated(context, 'you_are') ?? "",
              style: AppTextStyle.montserrat(
                  AppColors.shadedBlack, Get.width * 0.06, FontWeight.w600),
            ),
            SizedBox(
              height: Get.width * 0.05,
            ),
            Text(
              getTranslated(context, 'gender_available') ?? "",
              style: AppTextStyle.montserrat(
                  AppColors.lightGrey, Get.width * 0.035, FontWeight.w400),
            ),
            SizedBox(height: Get.width * 0.15),
            GestureDetector(
              onTap: (){
                dashPro.gender=1;
                setState(() {
                  if(dashPro.gender!=0)
                  {
                    dashPro.formCheck[dashPro.pageIndex]=1;
                  }
                  else
                  {
                    dashPro.formCheck[dashPro.pageIndex]=-1;
                  }
                });
                Get.forceAppUpdate();
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
                    Text(getTranslated(context, 'male')??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),textAlign: TextAlign.center,),
                    Image.asset(AppImages.maleIcon,scale: 3,color: Colors.transparent,),

                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                dashPro.gender=2;
                setState(() {
                  if(dashPro.gender!=0)
                  {
                    dashPro.formCheck[dashPro.pageIndex]=1;
                  }
                  else
                  {
                    dashPro.formCheck[dashPro.pageIndex]=-1;
                  }
                });
                Get.forceAppUpdate();
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
                    Text(getTranslated(context, 'female')??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),),
                    Image.asset(AppImages.femaleIcon,scale: 3, color: Colors.transparent,),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                dashPro.gender=3;
                setState(() {
                  if(dashPro.gender!=0)
                  {
                    dashPro.formCheck[dashPro.pageIndex]=1;
                  }
                  else
                  {
                    dashPro.formCheck[dashPro.pageIndex]=-1;
                  }
                });
                Get.forceAppUpdate();
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
                    Text(getTranslated(context, "can't decide")??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),),
                    Image.asset(AppImages.othersIcon,scale: 3,color: Colors.transparent,),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
