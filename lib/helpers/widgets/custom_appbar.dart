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
        height: Get.height*0.06,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 4) ,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withOpacity(0.5),
                  offset: Offset(0, 4),
                  blurRadius: 5.0)
            ]),
        child:widget.backButton? Padding(
          padding:  EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: widget.function,
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
              size: Get.width*0.06,
            ),
          ),
        ):IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.close,
            color: AppColors.black,
            size: Get.width*0.06,
          ),
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
