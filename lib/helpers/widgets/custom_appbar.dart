import 'package:amigos/helpers/widgets/appbar_button.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomAppBar extends StatefulWidget {
 bool backButton;
 VoidCallback function;
 String? title;
 CustomAppBar({required this.backButton, required this.function,   this.title});
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin:  EdgeInsets.symmetric(vertical: 12 , horizontal: 15),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(0.5), offset: Offset(0, 4), blurRadius: 5.0)
          ]
        ),

        child: IconButton(

          onPressed: widget.function,
          icon:Icon(widget.backButton==true? Icons.arrow_back_ios: Icons.clear,color: AppColors.black,),

        ),
      ),
      leadingWidth: Get.width*0.2,
      toolbarHeight: Get.width*0.3,
      title:  Text(getTranslated(context,widget.title??"")??"",style: AppTextStyle.montserrat(AppColors.black, Get.width*0.045, FontWeight.w500),),
      centerTitle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
    );
  }
}
