import 'package:amigos/helpers/widgets/appbar_button.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/ui/auth/login_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

class CustomAppBar extends StatefulWidget {
  bool backButton;
  VoidCallback function;
  String? title;
  String? suffix;
  CustomAppBar({required this.backButton, required this.function, this.title,this.suffix});
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        height: Get.height*0.035,
        width: Get.width*0.1,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        // padding: EdgeInsets.only(top: 4,right: 4,bottom: 4),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withOpacity(0.5),
                  offset: Offset(0, 1),
                  blurRadius: 2)
            ]
        ),
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
              size: Get.width*0.045,
            ),
          ),
        ),
      ),
      leadingWidth: Get.width * 0.2,
      toolbarHeight: Get.width * 0.3,
      title: Text(
        getTranslated(context, widget.title ?? "") ?? "",
        style: AppTextStyle.montserrat(
            AppColors.black, Get.width * 0.045, FontWeight.w500),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      actions: [
        widget.suffix!= null?GestureDetector(
          onTap: (){
            Share.share('CrewLuv');
          },
            child: Container(
                 margin: EdgeInsets.only(right: 10),
                child: Image.asset(widget.suffix??'',height: Get.height*0.3,width: Get.width*0.055,))):SizedBox(),
      ],
    );
  }
}
