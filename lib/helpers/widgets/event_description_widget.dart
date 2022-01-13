import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/event_model.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class EventDescriptionWidget extends StatefulWidget {
 EventModel model;
 bool titleImage;
 EventDescriptionWidget({ required this.model,required this.titleImage});

  @override
  _EventDescriptionWidgetState createState() => _EventDescriptionWidgetState();
}

class _EventDescriptionWidgetState extends State<EventDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.width*0.01),
      padding: EdgeInsets.symmetric(horizontal: Get.width*0.02,vertical: Get.width*0.02),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.1), offset: Offset(0, 10), blurRadius: 5.0)
        ],
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Get.width*0.02,),
          Row(
            children: [
              Text(widget.model.title??"",style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w700),),
              Spacer(),
              widget.titleImage?Image.asset(widget.model.titleImage??"",scale: 2.5,): SizedBox(height: Get.width*0.06,),
            ],
          ),
          Text(widget.model.description??"",style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.035, FontWeight.w400),),
          SizedBox(height: Get.width*0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.location,width: Get.width*0.03,height: Get.height*0.03,),
              SizedBox(width: Get.width*0.01,),
              Text('${widget.model.distance} ',style: AppTextStyle.montserrat(AppColors.eventBlack, Get.width*0.04, FontWeight.w400),),
              Text(widget.model.liveLocation??",Wapda Town",style: AppTextStyle.montserrat(AppColors.eventBlack, Get.width*0.04, FontWeight.w400)),
              const Spacer(),
              Text(widget.model.day??"",style: AppTextStyle.montserrat(AppColors.eventGrey, Get.width*0.03, FontWeight.w400)),
              const SizedBox(width: 2,),
              Text(widget.model.startTime??"",style: AppTextStyle.montserrat(AppColors.eventGrey, Get.width*0.03, FontWeight.w400))
            ],
          ),
          SizedBox(height: Get.width*0.02,),



        ],
      ),
    );
  }
}
