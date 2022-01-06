import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/PreferenceModel.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButtonSelected extends StatefulWidget {
  PreferenceModel model;
   AppButtonSelected(
      {Key? key,
        required this.model
      }) : super(key: key);

  @override
  _AppButtonSelectedState createState() => _AppButtonSelectedState();
}

class _AppButtonSelectedState extends State<AppButtonSelected> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Get.width*0.03,horizontal: Get.width*0.05),
      margin: EdgeInsets.only(right: Get.width*0.025,top:Get.width*0.03,bottom: Get.width*0.02 ),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.2), offset: const Offset(0, 4), blurRadius: 5.0)
        ],
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: widget.model.isSelected==true?AppColors.themeColor:AppColors.offWhite,
        ),
      ),
      child: Text(
        getTranslated(context, widget.model.name??'')??"",
        style: AppTextStyle.montserrat(widget.model.isSelected==true?AppColors.themeColor:AppColors.blackLite, Get.width*0.04, FontWeight.w400),
      ),
    );
  }
}
