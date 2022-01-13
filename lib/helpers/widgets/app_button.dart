import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  final double width;
  final String buttonText;
  final Function onpressed;
  final bool isWhite;
  AppButton({
    required this.buttonText,
    required this.onpressed, required this.width, required this.isWhite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.3), offset: Offset(0, 2), blurRadius: 5.0)
        ],
        gradient: isWhite==true?AppColors.buttonGradienWhite:AppColors.buttonGradientColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
            minimumSize: MaterialStateProperty.all(Size(width, 50)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: (){
          onpressed();
        },
        child: Padding(
          padding: EdgeInsets.only(
            top: Get.width*0.04,
            bottom: Get.width*0.04,
          ),
          child: Text(
            getTranslated(context, buttonText)??"",
            style: AppTextStyle.montserrat(isWhite==true?AppColors.shadedBlack:AppColors.whiteColor, Get.width*0.04, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
