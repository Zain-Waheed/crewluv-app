import 'package:amigos/models/event_type_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:emojis/emoji.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class MoodTypeWidget extends StatefulWidget {
  EventType type;
  bool isTitle;
  MoodTypeWidget({required this.type, this.isTitle=true});

  @override
  _MoodTypeWidgetState createState() => _MoodTypeWidgetState();

}

class _MoodTypeWidgetState extends State<MoodTypeWidget> {
 bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context,provider,_){
     return Container(
      height: Get.width*0.19,
      width: Get.width*0.15,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              decoration: BoxDecoration(
                border:widget.type.isSelected?Border.all(color: AppColors.themeColor):null
              ),
              child: Text('${Emoji.byChar(widget.type.image)}',style: AppTextStyle.montserrat(AppColors.black, Get.height*0.04, FontWeight.w600),)),
          SizedBox(height: Get.height*0.01,),
          Visibility(
            visible: widget.isTitle,
              child: Text(widget.type.title,style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.03, FontWeight.w400),),),
        ],
      ),
    );
    },);
  }
}
