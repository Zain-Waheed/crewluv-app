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
  bool  backButton;
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
      leading:Container(
        margin:  EdgeInsets.symmetric(vertical: Get.width*0.042, horizontal:Get.width*0.055),
        padding: EdgeInsets.only(left: widget.backButton?Get.width*0.01:0),
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
          onPressed:widget.function,
          icon: Icon(
            widget.backButton?Icons.arrow_back_ios:Icons.close,
            color: AppColors.black,
            size: Get.width*0.04,
          ),
        ),
      ),
      leadingWidth: Get.width * 0.2,
      toolbarHeight: Get.width * 0.35,
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
