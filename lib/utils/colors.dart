import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors {
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color backGround = const Color(0xffFFFCFD);
  static Color lightWhite= const Color(0xffF8F8F8);
  static Color progress= const Color(0xffF9D80D);
  static Color grey= const Color(0xffEBEBEB);
  static Color genderBorder= const Color(0xffECECEC);
  static Color themeBlue=const Color(0xff0191B6);
  static Color black= const Color(0xff1F1F1F);
  static Color shadedBlack= const Color(0xff484848);
  static Color greyText=const Color(0xff999999);
  static Color lightGrey=const Color(0xff707070);
  static Color themeColor=const Color(0xffFF7B17);
  static Color green=const Color(0xff34A853);
  static Color orangeLite =const Color(0xffF9D80D);
  static Color orangeDark= const Color(0xffFF7B17);
  static Color silverWhite = const Color(0xffF7F8FC);
  static LinearGradient blueGradientColor =  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.9],
    colors: [
      AppColors.orangeLite,
      AppColors.orangeDark,
    ],
  );
  static LinearGradient buttonGradientColor =  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.9],
    colors: [
      AppColors.orangeLite,
      AppColors.orangeDark,
    ],
  );
  static LinearGradient buttonGradienWhite = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.9],
    colors: [
      Color(0xffFFFFFF),
      Color(0xffFFFFFF),
    ],
  );




}