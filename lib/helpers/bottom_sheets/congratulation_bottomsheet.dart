import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CongraulationBottomSheet extends StatefulWidget {
  const CongraulationBottomSheet({Key? key}) : super(key: key);

  @override
  _CongraulationBottomSheetState createState() => _CongraulationBottomSheetState();
}

class _CongraulationBottomSheetState extends State<CongraulationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.width * 0.7,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          )),
      child: Column(
        children: [
          SizedBox(
            height: Get.width*0.1,
          ),
          Image.asset(AppImages.congratulationLogo,scale: 3,),
          Text(getTranslated(context, 'congratulations')??"",
            style: AppTextStyle.montserrat(AppColors.black, Get.width*0.06, FontWeight.w700),
          ),
          SizedBox(
            height: Get.width*0.05,
          ),
          Text(getTranslated(context, 'your_profile_has_been_completed')??"",
            style: AppTextStyle.montserrat(AppColors.grey, Get.width*0.05, FontWeight.w400),
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }
}
