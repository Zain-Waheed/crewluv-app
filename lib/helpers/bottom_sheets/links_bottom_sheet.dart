import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LinksBottomSheet extends StatefulWidget {
  const LinksBottomSheet({Key? key}) : super(key: key);

  @override
  _LinksBottomSheetState createState() => _LinksBottomSheetState();
}

class _LinksBottomSheetState extends State<LinksBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height*0.12,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: Get.width*0.04),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(left: Get.width*0.04,right:Get.width*0.4,top: Get.width*0.04,bottom: Get.width*0.04 ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
           onPressed: (){
             Get.back();
           },
           child: Column(
             children: [
                Icon(
                 Icons.location_on,
                  color:AppColors.black,
               ),
               Text(getTranslated(context, 'location')??"",
                 style: AppTextStyle.montserrat(
                   AppColors.black,
                   Get.width*0.03,
                   FontWeight.w400,
                 ),
               ),
             ],
           ),
       ),
          TextButton(
            onPressed: (){
              Get.back();
            },
            child: Column(
              children: [
                Icon(
                  Icons.picture_in_picture_rounded,color:AppColors.black,
                ),
                Text(getTranslated(context, 'images_videos')??"",
                  style: AppTextStyle.montserrat(
                    AppColors.black,
                    Get.width*0.03,
                    FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
