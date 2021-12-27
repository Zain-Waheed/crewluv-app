import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppInputDecoration{
  static InputDecoration circularFieldDecoration(Widget? preIcon,String hintText,Widget? suffixIcon)
  {
    return InputDecoration(
      hintText: getTranslated(Get.context, hintText),
      suffixIcon:suffixIcon !=null? Container(
          margin: EdgeInsets.only(right: Get.width*0.03),
          child: suffixIcon
      ):null,
      suffixIconConstraints: BoxConstraints(
        maxHeight: Get.width*0.08,
        maxWidth: Get.width*0.08,
      ),
      hintStyle: AppTextStyle.montserrat(AppColors.greyText, Get.width*0.04, FontWeight.w500,),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.greyText),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      isDense: true,
      filled: true,
    );
  }
  static InputDecoration withoutIcon(String hintText)
  {
    return InputDecoration(
      fillColor: AppColors.whiteColor,
      hintText: getTranslated(Get.context, hintText),
      hintStyle: AppTextStyle.montserrat(AppColors.greyText, Get.width*0.04, FontWeight.w500,),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.genderBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.genderBorder),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.genderBorder),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.genderBorder),
      ),
      isDense: true,
      filled: true,
    );
  }
}