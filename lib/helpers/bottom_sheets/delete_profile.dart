import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/auth/login_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class DeleteProfile extends StatefulWidget {
  const DeleteProfile({Key? key}) : super(key: key);

  @override
  _DeleteProfileState createState() => _DeleteProfileState();
}

class _DeleteProfileState extends State<DeleteProfile> {
  @override
  Widget build(BuildContext context) {
    return
    Consumer<DashboardProvider>(builder: (context,dashPro,_){
      return Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.logout2,height: Get.height*0.13,width: Get.width*0.4,),
              SizedBox(height: Get.height*0.04,),
              Text(getTranslated(context, 'delete_profile')??'',style: AppTextStyle.montserrat(AppColors.black, Get.width*0.045, FontWeight.w700),),
              SizedBox(height: Get.height*0.02,),
              Text(getTranslated(context, 'explain')??'',style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.037, FontWeight.w500),textAlign: TextAlign.center,),
              SizedBox(height: Get.height*0.05,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: AppInputDecoration.lessCircularDecoration(null, 'what_went_wrong2', null, AppColors.silverWhite),
                  maxLines: 3,
                ),
              ),
              SizedBox(height: Get.height*0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppButton(buttonText: 'no1',
                      onpressed: (){
                        Get.back();
                      },
                      width: Get.width*0.35, isWhite: true),
                  AppButton(buttonText: 'delete_profile1',onpressed: (){

                    Get.to(()=> const Login());
                    dashPro.onLogout();
                  } ,width: Get.width*0.35, isWhite: false),

                ],
              ),
              SizedBox(height: Get.height*0.03,),
            ],

          ),
        ),
      );
    });
  }
}
