import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppInputDecoration{
  static InputDecoration circularFieldDecoration(Widget? preIcon,String hintText,Widget? suffixIcon)
  {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
      fillColor: AppColors.offWhite,
      hintText: getTranslated(Get.context, hintText),
      suffixIcon:suffixIcon !=null? Container(
          margin: EdgeInsets.only(right: Get.width*0.03),
          child: suffixIcon
      ):null,
      suffixIconConstraints: BoxConstraints(
        maxHeight: Get.width*0.08,
        maxWidth: Get.width*0.08,
      ),
      hintStyle: AppTextStyle.montserrat(AppColors.greyText, Get.width*0.04, FontWeight.w400,),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.borderShadow),
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.borderShadow),
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
      filled: true,
    );
  }
  static InputDecoration circularFieldDecorationWithoutFocus(Widget? preIcon,String hintText,Widget? suffixIcon)
  {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
      fillColor: AppColors.offWhite,
      hintText: getTranslated(Get.context, hintText),
      suffixIcon:suffixIcon !=null? Container(
          margin: EdgeInsets.only(right: Get.width*0.03),
          child: suffixIcon
      ):null,
      suffixIconConstraints: BoxConstraints(
        maxHeight: Get.width*0.08,
        maxWidth: Get.width*0.08,
      ),
      hintStyle: AppTextStyle.montserrat(AppColors.greyText, Get.width*0.04, FontWeight.w400,),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.borderShadow),
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.borderShadow),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.borderShadow),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.borderShadow),
      ),
      filled: true,
    );
  }
  static InputDecoration circularFieldDecorationSmall(Widget? preIcon,String hintText,Widget? suffixIcon)
  {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
      fillColor: AppColors.offWhite,
      hintText: getTranslated(Get.context, hintText),
      suffixIcon:suffixIcon !=null? Container(
          margin: EdgeInsets.only(right: Get.width*0.03),
          child: suffixIcon
      ):null,
      suffixIconConstraints: BoxConstraints(
        maxHeight: Get.width*0.08,
        maxWidth: Get.width*0.08,
      ),
      hintStyle: AppTextStyle.montserrat(AppColors.greyText, Get.width*0.04, FontWeight.w400,),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.borderShadow),
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
      filled: true,
    );
  }
  static InputDecoration lessCircularDecoration(Widget? preIcon,String hintText,Widget? suffixIcon,Color color)
  {
    return InputDecoration(
      fillColor: color,
      contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
      hintText: getTranslated(Get.context, hintText),
      hintStyle: AppTextStyle.montserrat(AppColors.greyText, Get.width*0.04, FontWeight.w400,),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.genderBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      filled: true,
      suffixIcon: suffixIcon,
    );
  }
}