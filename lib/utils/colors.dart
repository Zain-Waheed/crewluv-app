import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color skyblue = const Color(0xffF3F4F9);
  static Color versionColor= const Color(0xff8C98A8);
  static Color greenishBlue = const Color(0xff37BBCA);
  static Color pink = const Color(0xffFFECE4);
  static Color orangedark = const Color(0xffFF7B17);
  static Color  geryLight = const Color(0xffAAB2BA);
  static Color backGround = const Color(0xffFFFCFD);
  static Color lightWhite= const Color(0xffF8F8F8);
  static Color progress= const Color(0xffF9D80D);
  static Color grey= const Color(0xffEBEBEB);
  static Color genderBorder= const Color(0xffECECEC);
  static Color themeBlue=const Color(0xff0191B6);
  static Color eventGrey=const Color(0xffB0AFB8);
  static Color eventBlack=const Color(0xff545659);
  static Color black3d=const Color(0xff3D3D3D);
  static Color black= const Color(0xff1F1F1F);
  static Color shadedBlack= const Color(0xff484848);
  static Color greyText=const Color(0xff999999);
  static Color lightGrey=const Color(0xff707070);
  static Color themeColor=const Color(0xffFF7B17);
  static Color green=const Color(0xff34A853);
  static Color orangeLite =const Color(0xffF9D80D);
  static Color orangeDark= const Color(0xffFF7B17);
  static Color silverWhite = const Color(0xffF7F8FC);
  static Color greenActive = const Color(0xff25D660);
  static Color opacBlack =   Colors.black.withOpacity(0.2);
  static Color slateGrey = const Color(0xffB2BAC1);
  static Color  solidGrey = const Color(0xffB2BAC1);


  static Color white = const Color(0xffFFFFFF);
  static Color whiteLite = const Color(0xffF2F2F3);
  static Color whiteBackground = const Color(0xffFFFCFD);
  static Color offWhite = const Color(0xffF7F8FC);
  static Color blackLite = const Color(0xff707070);
  static Color borderShadow= const Color(0xffECECEC);
  static Color blue= const Color(0xff0191B6);
  static Color whiteDark= const Color(0xffEEEEEE);
  static Color blueLight= const Color(0xff748A9D);
  static Color pinkLight= const Color(0xffFFE5D2);
  static Color greyDark= const Color(0xff545659);
  static Color bottomBarColor= const Color(0xffF9D80D);
  static Color brownColor=const Color(0xffD1B077);
  static Color jetBlack = const Color(0xff595959);
  static Color dotColor = const Color(0xffD1D4D8);
  static Color bottomSheetGrey = const Color(0xffE8ECF1);

  static LinearGradient greenishBlueGradient =  const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.9],
    colors: [
      Color(0xffD3DE16),
      Color(0xff0191B6),
    ],
  );

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


  static LinearGradient orangeGradientColor =  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.9],
    colors: [
      AppColors.orangeLite,
      AppColors.orangeDark,
    ],
  );
  static LinearGradient percantageBarGradientColor =  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.orangeLite,
      AppColors.orangeDark,
    ],
  );
  static LinearGradient buttonGradienOffWhite =  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.offWhite,
      AppColors.offWhite,
    ],
  );

  static LinearGradient blackGradien =  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.grey.withOpacity(0.0),
      Colors.black,
    ],
      stops: const [
        4.0,
        0.0,
      ]
  );
  static LinearGradient brownGradient=const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color(0xffBA8E2E),
        Color(0xff999999),
      ],
      stops: [
        4.0,
        0.0,
      ]
  );

}