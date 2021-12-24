import 'package:amigos/helpers/widgets/app_button_small.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
        builder: (context, provider, _)
    {
      return Scaffold(
          body: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height * .55,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(
                      top: Get.width * 0.099, left: Get.width * 0.06,),
                    decoration: BoxDecoration(
                      gradient:AppColors.blackGradien,
                      image: DecorationImage(
                        image: AssetImage(AppImages.userImage,),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.black.withOpacity(0.5),
                                offset: Offset(0, 4),
                                blurRadius: 5.0)
                          ]
                      ),
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: Get.height * .55,
                    padding: EdgeInsets.only(
                      top: Get.width * 0.099, left: Get.width * 0.06,),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      gradient: AppColors.blackGradien,
                    ),
                  ),
                ]
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width,
                  height: Get.height * .5,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(getTranslated(context, 'about') ?? "",
                          style: AppTextStyle.montserrat(
                              AppColors.shadedBlack, Get.width * 0.04,
                              FontWeight.w500),),
                        SizedBox(
                          height: Get.width * 0.02,
                        ),
                        Text(AppDummyData.shortText,
                          style: AppTextStyle.montserrat(
                              AppColors.lightGrey, Get.width * 0.04,
                              FontWeight.w500),),
                        SizedBox(
                          height: Get.width * 0.09,
                        ),
                        Text(getTranslated(context, 'interests') ?? "",
                          style: AppTextStyle.montserrat(
                              AppColors.shadedBlack, Get.width * 0.04,
                              FontWeight.w500),),
                        Row(
                          children: [
                            AppButtonSmall(preference:provider.interests[2]),
                            AppButtonSmall(preference:provider.interests[1]),
                            AppButtonSmall(preference:provider.interests[3]),
                          ],
                        ),
                        SizedBox(
                          height: Get.width * 0.04,
                        ),
                        Text(getTranslated(context, 'my_music') ?? "",
                          style: AppTextStyle.montserrat(
                              AppColors.shadedBlack, Get.width * 0.04,
                              FontWeight.w500),),
                        Row(
                          children: [
                            AppButtonSmall(preference:provider.musictaste[2]),
                            AppButtonSmall(preference:provider.musictaste[1]),
                            AppButtonSmall(preference:provider.musictaste[3]),
                          ],
                        ),
                        SizedBox(
                          height: Get.width * 0.04,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap:(){},
                              child: Container(
                                margin: EdgeInsets.only(right: Get.width*0.04),
                                width:Get.width*0.16,
                                height:Get.width*0.16,
                                alignment: Alignment.center,
                                padding:  const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.black.withOpacity(0.5),
                                          offset: Offset(0, 4),
                                          blurRadius: 5.0)
                                    ],
                                ),
                                child: Image.asset(AppImages.chat),
                              ),
                            ),
                            GestureDetector(
                              onTap:(){},
                              child: Container(
                                margin: EdgeInsets.only(right: Get.width*0.04),
                                width:Get.width*0.16,
                                height:Get.width*0.16,
                                alignment: Alignment.center,
                                padding:  const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.black.withOpacity(0.5),
                                        offset: Offset(0, 4),
                                        blurRadius: 5.0)
                                  ],
                                ),
                                child: Image.asset(AppImages.close),
                              ),
                            ),
                            GestureDetector(
                              onTap:(){},
                              child: Container(
                                margin: EdgeInsets.only(right: Get.width*0.04),
                                width:Get.width*0.16,
                                height:Get.width*0.16,
                                alignment: Alignment.center,
                                padding:  const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.black.withOpacity(0.5),
                                        offset: Offset(0, 4),
                                        blurRadius: 5.0)
                                  ],
                                ),
                                child: Image.asset(AppImages.heart),
                              ),
                            ),
                            GestureDetector(
                              onTap:(){},
                              child: Container(
                                margin: EdgeInsets.only(right: Get.width*0.04),
                                width:Get.width*0.16,
                                height:Get.width*0.16,
                                alignment: Alignment.center,
                                padding:  const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.black.withOpacity(0.5),
                                        offset: Offset(0, 4),
                                        blurRadius: 5.0)
                                  ],
                                ),
                                child: Image.asset(AppImages.starBlank),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
      );
    },);
  }
}
