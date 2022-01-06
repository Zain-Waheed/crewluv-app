import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/helpers/widgets/getplan_dialog.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/ui/dashboard/all_events.dart';
import 'package:amigos/ui/dashboard/chat_screen.dart';
import 'package:amigos/ui/dashboard/edit_profile.dart';
import 'package:amigos/ui/dashboard/settings_screen.dart';
import 'package:amigos/ui/dashboard/terms_of_use.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'dashboard.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PageController controller = PageController();
  int pageIndex=0;

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
          title: 'my_profile',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: Get.width * 0.05, vertical: Get.width * 0.02),
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.07, vertical: Get.width * 0.02),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(0.3),
                      offset: const Offset(0, 4),
                      blurRadius: 5)
                ]),
            child: Column(
              children: [
                Container(
                  width:Get.width*0.22,
                  height: Get.height*0.12,
                  child: Stack(

                    children: [
                      Center(
                        child: Container(
                          height: Get.height * 0.12,
                          padding: EdgeInsets.all(2),
                          width: Get.width * 0.25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.themeColor,
                                width: 2),
                            color: AppColors.white,
                          ),
                          child: Image.asset(
                            AppImages.notification1,
                            fit: BoxFit.contain,
                            height: Get.width * 0.23,
                            width: Get.width * 0.23,
                            scale: 0.1,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                          child: Container(
                              margin: EdgeInsets.only(top: Get.height*0.05),
                              child: Image.asset(AppImages.verified,height: Get.height*0.03,width: Get.width*0.05,))),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'stella, ',
                      style: AppTextStyle.montserrat(AppColors.shadedBlack,
                          Get.width * 0.033, FontWeight.w500),
                    ),
                    Text(
                      '24',
                      style: AppTextStyle.montserrat(AppColors.shadedBlack,
                          Get.width * 0.033, FontWeight.w500),
                    ),
                  ],
                ),
                Divider(
                  color: AppColors.whiteDark,
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        dashIndex=1;
                        dashController.jumpToPage(dashIndex);
                        setState(() {

                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '1',
                            style: AppTextStyle.montserrat(AppColors.shadedBlack,
                                Get.width * 0.05, FontWeight.w500),
                          ),
                          SizedBox(
                            height: Get.width * 0.015,
                          ),
                          Text(
                            getTranslated(context, "hosted") ?? "",
                            style: AppTextStyle.montserrat(AppColors.blackLite,
                                Get.width * 0.035, FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: Get.width * 0.1,
                      child: VerticalDivider(
                        thickness: 2,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        dashIndex=1;
                        dashController.jumpToPage(dashIndex);
                        setState(() {

                        });
                        allEventsIndex=1;
                        allEventsController.jumpToPage(allEventsIndex);
                        setState(() {

                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            '3',
                            style: AppTextStyle.montserrat(AppColors.shadedBlack,
                                Get.width * 0.05, FontWeight.w500),
                          ),
                          SizedBox(
                            height: Get.width * 0.015,
                          ),
                          Text(
                            getTranslated(context, "joined") ?? "",
                            style: AppTextStyle.montserrat(AppColors.blackLite,
                                Get.width * 0.035, FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: Get.width * 0.1,
                      child: VerticalDivider(
                        thickness: 2,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        dashIndex=3;
                        dashController.jumpToPage(dashIndex);
                        setState(() {

                        });
                        chatIndex=1;
                        chatController.jumpToPage(chatIndex);
                        setState(() {

                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            '1',
                            style: AppTextStyle.montserrat(AppColors.shadedBlack,
                                Get.width * 0.05, FontWeight.w500),
                          ),
                          SizedBox(
                            height: Get.width * 0.015,
                          ),
                          Text(
                            getTranslated(context, "crews") ?? "",
                            style: AppTextStyle.montserrat(AppColors.blackLite,
                                Get.width * 0.035, FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.to(()=> const SettingsScreen());
                          },
                          child: Container(
                            height: Get.height * 0.12,
                            width: Get.width * 0.12,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.black.withOpacity(0.3),
                                      offset: Offset(0, 4),
                                      blurRadius: 5.0)
                                ]),
                            child: Image.asset(
                              AppImages.settings,
                              scale: 3,

                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.width * 0.01,
                        ),
                        Text(
                          getTranslated(context, "settings") ?? "",
                          style: AppTextStyle.montserrat(AppColors.shadedBlack,
                              Get.width * 0.04, FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.to(()=>const EditProfile());
                          },
                          child: Container(
                            height: Get.width * 0.12,
                            width: Get.width * 0.12,
                            margin: EdgeInsets.only(top: Get.height*0.05),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.black.withOpacity(0.3),
                                      offset: Offset(0, 4),
                                      blurRadius: 5.0)
                                ]),
                            child: Image.asset(
                              AppImages.edit,
                              scale: 3,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.width * 0.01,
                        ),
                        Text(
                          getTranslated(context, "edit") ?? "",
                          style: AppTextStyle.montserrat(AppColors.shadedBlack,
                              Get.width * 0.04, FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.to(()=>TermsOfUse(termsOfUse: false));
                          },
                          child: Container(
                            height: Get.width * 0.12,
                            width: Get.width * 0.12,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.black.withOpacity(0.3),
                                      offset: Offset(0, 4),
                                      blurRadius: 5.0)
                                ]),
                            child: Image.asset(
                              AppImages.privacy,
                              scale: 3,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.width * 0.01,
                        ),
                        Text(
                          getTranslated(context, "privacy") ?? "",
                          style: AppTextStyle.montserrat(AppColors.shadedBlack,
                              Get.width * 0.04, FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05,vertical: Get.width*0.01),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(0.9),
                      offset: const Offset(0, 4),
                      blurRadius: 5),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: Get.width*0.25,
                      child: PageView(
                        controller: controller,
                        onPageChanged: (value){
                          pageIndex = value;
                          setState(() {

                          });

                        },
                        children:List.generate(5, (index) =>  Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.brownColor,
                                ),
                                  child: Image.asset(AppImages.appLogoSmall,width: Get.width*0.08,height: Get.height*0.08,)),
                              SizedBox(
                                width: Get.width*0.01,
                              ),
                              Text('intro Text',
                                style: AppTextStyle.montserrat(
                                  AppColors.blackLite,
                                  Get.width*0.04,
                                  FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Text(AppDummyData.mediumText,style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.032, FontWeight.w300),maxLines: 2, overflow: TextOverflow.ellipsis,),

                        ],))

                      ),
                    ),
                    SizedBox(height: Get.height*0.01,),
                    SmoothPageIndicator(
                      count: 5,
                      effect: ExpandingDotsEffect(
                        expansionFactor: 4.5,
                        strokeWidth: 2,
                        dotColor: AppColors.dotColor,
                        dotWidth: Get.width * 0.02,
                        dotHeight: Get.width * 0.02,
                        spacing: Get.width * 0.01,
                        activeDotColor: AppColors.themeColor,
                      ),
                      controller: controller,
                    ),
                    SizedBox(height: Get.height*0.012,),
                    AppButton(buttonText: 'learn_more', onpressed: (){Get.dialog(GetPlanDialogBox(func: (){}, ));}, width: Get.width, isWhite: false),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
