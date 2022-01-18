import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class EmptyScreenWidget extends StatefulWidget {
  String image;
  String title;
  String? subtitle;

  EmptyScreenWidget({required this.image, required this.title, this.subtitle});

  @override
  _EmptyScreenWidgetState createState() => _EmptyScreenWidgetState();
}

class _EmptyScreenWidgetState extends State<EmptyScreenWidget> {
  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(widget.image,height: Get.height*0.14,width: Get.width*0.3,),
          SizedBox(height: Get.height*0.05,),
          Text(getTranslated(context, widget.title)??'',style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w600),),
          SizedBox(height: Get.height*0.01,),
          Text(getTranslated(context, widget.subtitle??"")??'',style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04,FontWeight.w400),),



        ],

      ),
    );
  }
}
