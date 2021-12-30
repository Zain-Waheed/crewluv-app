import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/PreferenceModel.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PrefrenceWidget extends StatefulWidget {
  final PreferenceModel? preference;
  const PrefrenceWidget({Key? key, this.preference}) : super(key: key);

  @override
  _PrefrenceWidgetState createState() => _PrefrenceWidgetState();
}

class _PrefrenceWidgetState extends State<PrefrenceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Get.width*0.02,horizontal: Get.width*0.05),
      margin: EdgeInsets.only(top:Get.width*0.01 ),
      decoration: BoxDecoration(
        gradient: widget.preference!.isSelected==true?AppColors.buttonGradienWhite:AppColors.buttonGradientColor,
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.2), offset: const Offset(0, 4), blurRadius: 5.0)
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        getTranslated(context, widget.preference!.name ?? "")??"",
        style: AppTextStyle.montserrat(widget.preference!.isSelected==true?AppColors.blackLite:AppColors.white, Get.width*0.035, FontWeight.w600),
      ),
    );
  }
}
