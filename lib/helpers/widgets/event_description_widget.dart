import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/event_model.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class EventDescriptionWidget extends StatefulWidget {
 EventModel model;
 EventDescriptionWidget({ required this.model});

  @override
  _EventDescriptionWidgetState createState() => _EventDescriptionWidgetState();
}

class _EventDescriptionWidgetState extends State<EventDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.width*0.03),
      padding: EdgeInsets.symmetric(horizontal: Get.width*0.02,vertical: Get.width*0.01),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.lightGrey.withOpacity(0.2), offset: Offset(0, 4), blurRadius: 5.0)
        ],
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(widget.model.title??"",style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w700),),
              Spacer(),
              Image.asset(widget.model.titleImage??"",scale: 2.5,),
            ],
          ),
          Text(widget.model.description??"",style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.035, FontWeight.w400),),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(AppImages.location,scale: 2.5,),
              Text('${widget.model.distance}',style: AppTextStyle.montserrat(AppColors.eventBlack, Get.width*0.035, FontWeight.w400),),
              Text(getTranslated(context, "miles_away")??"",style: AppTextStyle.montserrat(AppColors.eventBlack, Get.width*0.035, FontWeight.w400)),
              Spacer(),
              Text(widget.model.day??"",style: AppTextStyle.montserrat(AppColors.eventGrey, Get.width*0.03, FontWeight.w400)),
              SizedBox(width: 2,),
              Text(widget.model.startTime??"",style: AppTextStyle.montserrat(AppColors.eventGrey, Get.width*0.03, FontWeight.w400))
            ],
          )
        ],
      ),
    );
  }
}
