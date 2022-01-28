import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/helpers/widgets/getplan_dialog.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
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
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


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
    return Consumer<DashboardProvider>(builder: (context,provider,_){
      return Scaffold(
        appBar: AppBar(
          title: Text(getTranslated(context, "my_profile")??'',style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),),
          elevation: 0,
          centerTitle: true,
          backgroundColor:Theme.of(context).scaffoldBackgroundColor,

        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Get.height*0.38,
                margin: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.018, vertical: Get.width * 0.02),
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.07, vertical: Get.height * 0.02),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: Get.height*0.2,
                        padding: EdgeInsets.symmetric(horizontal: Get.width*0.1),
                        decoration: BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(30)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                provider.dashboardIndex=1;
                                provider.update();
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '1',
                                    style: AppTextStyle.montserrat(AppColors.whiteColor,
                                        Get.width * 0.05, FontWeight.w500),
                                  ),
                                  Text(
                                    getTranslated(context, "hosted") ?? "",
                                    style: AppTextStyle.montserrat(AppColors.whiteColor,
                                        Get.width * 0.035, FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),

                                ],
                              ),
                            ),
                            GestureDetector(

                              onTap: (){
                                provider.dashboardIndex=1;
                                provider.allEventPageIndex=1;
                                provider.update();
                                setState(() {

                                });




                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '3',
                                    style: AppTextStyle.montserrat(AppColors.whiteColor,
                                        Get.width * 0.05, FontWeight.w500),
                                  ),
                                  Text(
                                    getTranslated(context, "joined") ?? "",
                                    style: AppTextStyle.montserrat(AppColors.whiteColor,
                                        Get.width * 0.035, FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),

                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                provider.dashboardIndex=2;
                                provider.chatPageIndex=1;
                                provider.update();
                                setState(() {

                                });

                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '1',
                                    style: AppTextStyle.montserrat(AppColors.whiteColor,
                                        Get.width * 0.05, FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: Get.width * 0.015,
                                  ),
                                  Text(
                                    getTranslated(context, "crews") ?? "",
                                    style: AppTextStyle.montserrat(AppColors.whiteColor,
                                        Get.width * 0.035, FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: Get.height*0.26,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.black.withOpacity(0.2),blurRadius: 5
                              )
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width:Get.width*0.3,
                              height: Get.height*0.2,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      height: Get.height * 0.2,
                                      width: Get.width * 0.35,
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: AppColors.themeColor,
                                            width: 3),
                                        color: AppColors.white,
                                      ),
                                      child: Image.asset(
                                        AppImages.notification1,
                                        fit: BoxFit.contain,
                                        height: Get.width * 0.3,
                                        width: Get.width * 0.3,
                                        scale: 0.1,
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                          margin: EdgeInsets.only(top: Get.height*0.08),
                                          child: Image.asset(AppImages.verified,height: Get.height*0.05,width: Get.width*0.07,))),
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
                                      Get.width * 0.04, FontWeight.w500),
                                ),
                                Text(
                                  '24',
                                  style: AppTextStyle.montserrat(AppColors.shadedBlack,
                                      Get.width * 0.04, FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.width * 0.03,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width*0.15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       children: [
                         GestureDetector(
                           onTap: (){
                             Get.to(()=> const SettingsScreen());
                           },
                           child: Container(
                             height: Get.height * 0.07,
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
                               height: Get.height*0.07,
                               width: Get.width*0.1,

                             ),
                           ),
                         ),
                         SizedBox(height: Get.width*0.01,),
                         Text(
                           getTranslated(context, "settings") ?? "",
                           style: AppTextStyle.montserrat(AppColors.shadedBlack,
                               Get.width * 0.032, FontWeight.w400),
                         ),

                       ],

                     ),
                     Column(
                       children: [
                         SizedBox(height: Get.width*0.06,),
                         GestureDetector(
                           onTap: (){
                             Get.to(()=> const EditProfile());
                           },
                           child: Container(
                             height: Get.height * 0.07,
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
                               AppImages.edit,
                               height: Get.height*0.07,
                               width: Get.width*0.1,

                             ),
                           ),
                         ),

                         SizedBox(height: Get.width*0.01,),
                         Text(
                           getTranslated(context, "edit2") ?? "",
                           style: AppTextStyle.montserrat(AppColors.shadedBlack,
                               Get.width * 0.032, FontWeight.w400),
                         ),
                       ],

                     ),
                     Column(
                       children: [
                         GestureDetector(
                           onTap: (){
                             Get.to(TermsOfUse(termsOfUse: false));
                           },
                           child: Container(
                             height: Get.height * 0.07,
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
                               height: Get.height*0.08,
                               width: Get.width*0.13,
                             ),
                           ),
                         ),
                         SizedBox(height: Get.width*0.01,),
                         Text(
                           getTranslated(context, "privacy2") ?? "",
                           style: AppTextStyle.montserrat(AppColors.shadedBlack,
                               Get.width * 0.032, FontWeight.w400),
                         ),
                       ],
                     ),
                   ],
                 ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05,vertical: Get.height*0.01),
                decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
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
                                      child: Image.asset(AppImages.logo,width: Get.width*0.07,height: Get.height*0.07,)),
                                  SizedBox(
                                    width: Get.width*0.01,
                                  ),
                                  Text('Intro Text',
                                    style: AppTextStyle.montserrat(
                                      AppColors.blackLite,
                                      Get.width*0.045,
                                      FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Text(AppDummyData.mediumText,style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w300),maxLines: 2, overflow: TextOverflow.ellipsis,),

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
                      SizedBox(height: Get.height*0.05,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.black.withOpacity(0.3), offset: Offset(0, 2), blurRadius: 5.0)
                          ],
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(Size(Get.width*0.8, 50)),
                            backgroundColor: MaterialStateProperty.all(Colors.transparent),
                            shadowColor: MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: (){
                            Get.dialog(GetPlanDialogBox());
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: Get.width*0.04,
                              bottom: Get.width*0.04,
                            ),
                            child: Text(
                              getTranslated(context, "learn_more")??"",
                              style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w600),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.15,)
            ],
          ),
        ),
      );
    },);

  }
}
