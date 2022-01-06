import 'package:amigos/helpers/bottom_sheets/change_password_bottomsheet.dart';
import 'package:amigos/helpers/bottom_sheets/further_subscription.dart';
import 'package:amigos/helpers/bottom_sheets/logout_bottomsheet.dart';
import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/helpers/widgets/getplan_dialog.dart';
import 'package:amigos/helpers/widgets/subcription_dialog.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/ui/dashboard/about_application.dart';
import 'package:amigos/ui/dashboard/faqs.dart';
import 'package:amigos/ui/dashboard/terms_of_use.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  PageController controller = PageController();
  int pageIndex= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.width*0.17),
        child: CustomAppBar(
          title: 'settings',
          backButton: true,
          function: (){Get.back();},
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: Get.height*0.01),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal:Get.width*0.05,vertical: Get.width*0.05),
                margin: EdgeInsets.symmetric(horizontal: Get.width*0.05,),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: AppColors.black.withOpacity(0.2),offset: Offset(0,1),blurRadius: 5),
                  ]
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(getTranslated(context, 'phone_number')??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),),
                        Spacer(),
                        Text('+92 3326382943',style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),),

                      ],
                    ),
                    SizedBox(height:Get.width*0.01),
                    Divider(),
                    Row(
                      children: [
                        Text(getTranslated(context, 'email')??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),),
                        Spacer(),
                        Text('stella@gmail.com',style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),),

                      ],
                    ),
                    SizedBox(height:Get.width*0.01),
                    Divider(),
                    Row(
                      children: [
                        Text(getTranslated(context, 'dob2')??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),),
                        Spacer(),
                        Text('29 Jan, 1998',style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),),

                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: Get.height*0.02,),
              settingsWidget(AppImages.subscription2,'subscription' , () { Get.dialog( GetPlanDialogBox(func: (){Get.bottomSheet(FurtherSubscription());},)); }),
              settingsWidget(AppImages.changePassword,'change_password' , () { Get.bottomSheet(const ChangePassword() , isScrollControlled: true);}),
              settingsWidget(AppImages.termsOfUse,'terms_of_use' , () {Get.to(()=>  TermsOfUse(termsOfUse: true,));}),
              settingsWidget(AppImages.faqs, 'faqs', () { Get.to(()=> Faqs());}),
              settingsWidget(AppImages.aboutApplication, 'about_application', () {Get.to(()=>AboutApplication());}),
              settingsWidget(AppImages.logout, 'logout', () { Get.bottomSheet(LogoutBottomSheet(),isScrollControlled: true);}),
              SizedBox(height: Get.height*0.02,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05,vertical: Get.height*0.003),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.black.withOpacity(0.2),
                        offset: const Offset(0, 2),
                        blurRadius: 5),
                  ],
                ),
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
                                  width: Get.height*0.005,
                                ),
                                Text('intro Text',
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
                    SizedBox(height: Get.height*0.025,),
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
                    SizedBox(height: Get.height*0.02,),
                    AppButton(buttonText: 'learn_more', onpressed: (){Get.dialog(GetPlanDialogBox(func: (){},));}, width: Get.width, isWhite: false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
  Widget settingsWidget( String image,String text,VoidCallback function){
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Get.height*0.009, horizontal: Get.width*0.05,),
        padding:EdgeInsets.all( Get.width*0.035),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: AppColors.black.withOpacity(0.2),
                offset: const Offset(0,1),blurRadius: 1
            )
          ]
        ),
        child: Row(
          children: [
            Image.asset(image,scale: 3.5,),
            SizedBox(
              width: Get.width*0.04,
            ),
            Text(getTranslated(context, text)??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),),
            Spacer(),
            Icon(Icons.arrow_forward_ios,size: Get.width*0.03,),
          ],
        ),

      ),
    );
  }
}
