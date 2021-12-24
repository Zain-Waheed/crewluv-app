import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/PreferenceModel.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButtonSmall extends StatefulWidget {
  final PreferenceModel? preference;
  const AppButtonSmall({Key? key,  required this.preference,}) : super(key: key);

  @override
  _AppButtonSmallState createState() => _AppButtonSmallState();
}

class _AppButtonSmallState extends State<AppButtonSmall> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.preference!.isSelected = !widget.preference!.isSelected!;
        setState(() {

        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Get.width*0.03,horizontal: Get.width*0.05),
        margin: EdgeInsets.only(right: Get.width*0.025,top:Get.width*0.03 ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(0.2), offset: Offset(0, 4), blurRadius: 5.0)
          ],
          gradient: widget.preference!.isSelected==true?AppColors.buttonGradientColor:AppColors.buttonGradienOffWhite,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          getTranslated(context, widget.preference!.name ?? "")??"",
          style: AppTextStyle.montserrat(widget.preference!.isSelected==true?AppColors.white:AppColors.blackLite, Get.width*0.04, FontWeight.w400),
        ),
      ),
    );
  }
}
