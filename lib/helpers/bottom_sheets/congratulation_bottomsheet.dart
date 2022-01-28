import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/ui/dashboard/event_details.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CongraulationBottomSheet extends StatefulWidget {
 final String text;
 bool  comingFromPartyList;
 CongraulationBottomSheet({Key? key, required this.text, this.comingFromPartyList=false}) : super(key: key);

  @override
  _CongraulationBottomSheetState createState() => _CongraulationBottomSheetState();
}

class _CongraulationBottomSheetState extends State<CongraulationBottomSheet> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.comingFromPartyList==true){
      Future.delayed(Duration(seconds: 3),(){
        Get.to(EventDetails(index: 1,commingFromList: true,),);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: Get.width*0.1,
          ),
          Image.asset(AppImages.congratulationLogo,height: Get.height*0.13,width: Get.width*0.3,),
          Text(getTranslated(context, 'congratulations')??"",
            style: AppTextStyle.montserrat(AppColors.black, Get.width*0.05, FontWeight.w700),
          ),
          SizedBox(
            height: Get.width*0.05,
          ),
          Text(getTranslated(context, widget.text)??"",
            style: AppTextStyle.montserrat(AppColors.blackLite, Get.width*0.045, FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Get.width*0.05,
          ),
        ],
      ),
    );
  }
}
