import 'dart:ui';

import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/app_button_selected.dart';
import 'package:amigos/helpers/widgets/app_button_small.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/edit_profile.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class EditInterests extends StatefulWidget {
  const EditInterests({Key? key}) : super(key: key);

  @override
  _EditInterestsState createState() => _EditInterestsState();
}

class _EditInterestsState extends State<EditInterests> {
  bool value=false;
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder:(context,provider,_){

      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
          color: AppColors.whiteColor,

        ),
        padding: EdgeInsets.symmetric(horizontal: Get.width*0.05),
        child:Column(
          children: [
            Center(
              child: Container(
                width: Get.width * 0.25,
                padding: EdgeInsets.symmetric(vertical: Get.width * 0.008),
                margin: EdgeInsets.symmetric(vertical: Get.width * 0.03),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.bottomSheetGrey),
              ),
            ),
            SizedBox(height: Get.width*0.01,),
            Text(getTranslated(context, "edit_interests")??"",style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w700),),
            SizedBox(height: Get.width*0.01,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      children: List.generate(provider.interests.length, (index) => GestureDetector(
                          onTap: (){
                            value= provider.interests[index].isSelected;
                            provider.interests[index].isSelected= !value;
                            setState(() {

                            });

                          },
                          child: AppButtonSelected(model: provider.interests[index]))),
                    ),
                    SizedBox(height: Get.width*0.07,),
                    AppButton(buttonText: 'save_changes', onpressed: (){
                      provider.update();
                      setState(() {

                      });
                      Get.back();
                    }, width: Get.width*0.9, isWhite: false),
                    SizedBox(height: Get.width*0.05,),
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
