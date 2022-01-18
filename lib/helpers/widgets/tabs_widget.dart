import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsWidget extends StatefulWidget {
  String text;
  bool selected;

  TabsWidget(this.text, this.selected);

  @override
  _TabsWidgetState createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  @override
  Widget build(BuildContext context) {

    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.selected?AppColors.themeColor:AppColors.offWhite,
      ),
      child: Center(child: Text(getTranslated(context, widget.text)??"",style: AppTextStyle.montserrat(widget.selected?AppColors.whiteColor:AppColors.shadedBlack, Get.width*0.04, FontWeight.w400),)),
    );
  }
}
