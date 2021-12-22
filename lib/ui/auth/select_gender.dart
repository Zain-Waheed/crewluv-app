import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
class SelectGender extends StatefulWidget {
  const SelectGender({Key? key}) : super(key: key);

  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  int gender=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.width * 0.17),
        child: CustomAppBar(
            function: () {
              Get.back();
            },
            backButton: true,
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
                      linearGradient: AppColors.buttonGradientColor,
                      fillColor: AppColors.grey,
                      percent: 0.5,
                      lineHeight: Get.width*0.04,
                    ),
                  ),
                  SizedBox(width: Get.width*0.01,),
                  Text('50%',style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.04, FontWeight.w300),)
                ],

              ),

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
                  gender=1;
                  setState(() {

                  });
                },
                child: Container(
                  height: Get.width*0.17,
                  width: Get.width*0.9,
                  decoration: BoxDecoration(
                   color: AppColors.silverWhite,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color:gender!=1?AppColors.genderBorder:AppColors.themeColor),
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
                  gender=2;
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
                    border: Border.all(color:gender!=2?AppColors.genderBorder:AppColors.themeColor),
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
                  gender=3;
                  setState(() {

                  });
                },
                child: Container(
                  height: Get.width*0.17,
                  width: Get.width*0.9,
                  decoration: BoxDecoration(
                    color: AppColors.silverWhite,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color:gender!=3?AppColors.genderBorder:AppColors.themeColor),
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
        ),
      ),
    );
  }
}
