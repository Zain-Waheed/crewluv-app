import 'package:amigos/helpers/bottom_sheets/filters_bottomsheet.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding:  EdgeInsets.only(top:Get.width*0.04,),
        child: FloatingActionButton.extended(
          backgroundColor: AppColors.whiteBackground,
          onPressed: () {
            Get.bottomSheet(
              FiltersBottomSheet(), isScrollControlled: true,
            );
          },
          label: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getTranslated(context, 'filter')??"",
                style: AppTextStyle.montserrat(
                    AppColors.blackLite, Get.width*0.04, FontWeight.w700
                ),
              ),
              SizedBox(
                width: Get.width*0.02,
              ),
              Image.asset(AppImages.filter),
            ],
          ),
        ),
      ),
      body: Container(
        color: AppColors.blackLite,
      ),
    );
  }
}

