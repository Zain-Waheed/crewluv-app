import 'dart:io';

import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LinksBottomSheet extends StatefulWidget {
  const LinksBottomSheet({Key? key}) : super(key: key);

  @override
  _LinksBottomSheetState createState() => _LinksBottomSheetState();
}

class _LinksBottomSheetState extends State<LinksBottomSheet> {
  List<File> files = [];

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
                GestureDetector(
                  onTap:(){
                    pickFileLicense();
                  },
                  child: Icon(
                    Icons.picture_in_picture_rounded,color:AppColors.black,
                  ),
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
  Future<void> pickFileLicense() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: ['pdf', 'docx', 'png', 'jpg'],
    );

    if (result != null) {
      files = result.paths.map((path) => File(path!)).toList();
      print(files);
    } else {
      // User canceled the picker
    }
  }
}
