import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'app_button.dart';
import 'mood_type_widget.dart';
class MoodWidget extends StatefulWidget {
  const MoodWidget({Key? key}) : super(key: key);

  @override
  _MoodWidgetState createState() => _MoodWidgetState();
}

class _MoodWidgetState extends State<MoodWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder:(context,provider,_){
      return Scaffold(
        backgroundColor: AppColors.opacBlack,
        body: Center(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16),
              ),
              margin: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.width*0.05),
              padding: EdgeInsets.symmetric(horizontal:Get.width*0.02,vertical: Get.width*0.05),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(getTranslated(context, 'up_for')??"",style: AppTextStyle.montserrat(AppColors.black, Get.width*0.05, FontWeight.w700),),
                  SizedBox(height: Get.width*0.01,),
                  Text(getTranslated(context, 'share_updates')??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w400),),
                  SizedBox(height: Get.width*0.07,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(provider.eventTypes.length, (index){
                        return MoodTypeWidget(type: provider.eventTypes[index]);
                      }),
                    ),
                  ),
                  SizedBox(height: Get.width*0.05,),
                  Align( alignment: Alignment.centerLeft, child: Text(getTranslated(context, 'in_mood')??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),)),
                  SizedBox(height: Get.width*0.02,),
                  TextFormField(
                   maxLines: 2,
                  decoration: AppInputDecoration.lessCircularDecoration(null,getTranslated(context, 'type_here')??'',null,AppColors.silverWhite),
                  ),
                  SizedBox(height: Get.width*0.1,),
                  AppButton(width: Get.width,isWhite: false,buttonText: 'lets_go',onpressed: (){},)
                ],
              ),
            )

        ),
      );

    });

  }
}
