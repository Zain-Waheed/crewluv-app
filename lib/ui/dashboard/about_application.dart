import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AboutApplication extends StatefulWidget {
  const AboutApplication({Key? key}) : super(key: key);

  @override
  _AboutApplicationState createState() => _AboutApplicationState();
}

class _AboutApplicationState extends State<AboutApplication> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.width * 0.17),
        child: CustomAppBar(
          backButton: true,
          function: () {Get.back();},
          title: 'about_application',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
              margin: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.05, vertical: Get.height * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.opacBlack,
                    offset: Offset(0, 2),
                    blurRadius: 5,
                  )
                ],
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      AppImages.smallLogo,
                      scale: 3.5,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Version 1.1.1',
                    style: AppTextStyle.montserrat(AppColors.versionColor,
                        Get.width * 0.03, FontWeight.w400),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
              margin: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.05, vertical: Get.height * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.opacBlack,
                    offset: Offset(0, 2),
                    blurRadius: 5,
                  )
                ],
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTranslated(context, 'website') ?? "",
                        style: AppTextStyle.montserrat(AppColors.shadedBlack,
                            Get.width * 0.03, FontWeight.w500),
                      ),
                      SizedBox(
                        height: Get.height * 0.005,
                      ),
                      Text(
                        'Crewluv.com',
                        style: AppTextStyle.montserrat(AppColors.themeColor,
                            Get.width * 0.03, FontWeight.w500),
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      Clipboard.setData(ClipboardData(text: 'WWW.CrewLuv.com'));
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.greenishBlueGradient),
                      child: Image.asset(
                        AppImages.copy,
                        scale: 3,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
              margin: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.05, vertical: Get.height * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.opacBlack,
                    offset: Offset(0, 2),
                    blurRadius: 5,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    getTranslated(context, 'follow_us') ?? "",
                    style: AppTextStyle.montserrat(
                        AppColors.shadedBlack, Get.width * 0.03, FontWeight.w500),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        AppImages.facebook2,
                        scale: 3,
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      Image.asset(
                        AppImages.google2,
                        scale: 3,
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      Image.asset(
                        AppImages.twitter,
                        scale: 3,
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      Image.asset(
                        AppImages.insta,
                        scale: 3,
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: Get.width,
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05, vertical: Get.height * 0.01),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: AppColors.opacBlack,offset: Offset(0,2),blurRadius: 5)
                ],

              ),
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),
                        color: AppColors.greenishBlue
                    ),
                    child: Text(AppDummyData.shortText,style: AppTextStyle.montserrat(AppColors.whiteColor, Get.width*0.032, FontWeight.w400),),

                  ),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                    ),
                    child: Text(AppDummyData.mediumText,style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.032, FontWeight.w400),),

                  )
                ],
              ),
            ),
            Container(
              width: Get.width,
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05, vertical: Get.height * 0.01),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: AppColors.opacBlack,offset: Offset(0,2),blurRadius: 5)
                ],

              ),
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),
                        color: AppColors.greenishBlue
                    ),
                    child: Text(AppDummyData.shortText,style: AppTextStyle.montserrat(AppColors.whiteColor, Get.width*0.032, FontWeight.w400),),

                  ),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                    ),
                    child: Text(AppDummyData.mediumText,style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.032, FontWeight.w400),),

                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
