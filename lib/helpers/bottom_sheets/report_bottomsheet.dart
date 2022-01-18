import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportBottomSheet extends StatefulWidget {
  const ReportBottomSheet({Key? key}) : super(key: key);

  @override
  _ReportBottomSheetState createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.65,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          )),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppImages.logout2,height: Get.height*0.12,width: Get.width*0.4,),
            SizedBox(height: Get.height*0.03,),
            Text(getTranslated(context, 'congratulations')??'',style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),),
            SizedBox(height: Get.height*0.012,),
            Text(getTranslated(context, 'will_not_know')??'',style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.035, FontWeight.w500),),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.001),
              margin: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.007),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor,
                  boxShadow:[
                    BoxShadow(
                        color: AppColors.opacBlack.withOpacity(0.1),
                        offset: const Offset(0,20),
                        blurRadius: 5


                    )
                  ]
              ),
              child: Row(
                children: [
                  Text(getTranslated(context, "fake")??''),
                  Spacer(),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: AppColors.themeColor),
                    child: Checkbox(
                      value: false,
                      activeColor: AppColors.themeColor,
                      onChanged: (value) {
                        value = value!;
                        setState(() {});
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),


                ],
              ),

            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.001),
              margin: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.007),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor,
                  boxShadow:[
                    BoxShadow(
                        color: AppColors.opacBlack.withOpacity(0.1),
                        offset: const Offset(0,20),
                        blurRadius: 5


                    )
                  ]
              ),
              child: Row(
                children: [
                  Text(getTranslated(context, "not_interested")??''),
                  Spacer(),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: AppColors.themeColor),
                    child: Checkbox(
                      value: false,
                      activeColor: AppColors.themeColor,
                      onChanged: (value) {
                        value = value!;
                        setState(() {});
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),

            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.001),
              margin: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.007),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor,
                  boxShadow:[
                    BoxShadow(
                        color: AppColors.opacBlack.withOpacity(0.1),
                        offset: const Offset(0,20),
                        blurRadius: 5


                    )
                  ]
              ),
              child: Row(
                children: [
                  Text(getTranslated(context, "Inappropriate_message")??''),
                  Spacer(),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: AppColors.themeColor),
                    child: Checkbox(
                      value: false,
                      activeColor: AppColors.themeColor,
                      onChanged: (value) {
                        value = value!;
                        setState(() {});
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),


                ],
              ),

            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.001),
              margin: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.007),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor,
                  boxShadow:[
                    BoxShadow(
                        color: AppColors.opacBlack.withOpacity(0.1),
                        offset: const Offset(0,4),
                        blurRadius: 2


                    )
                  ]
              ),
              child: Row(
                children: [
                  Text(getTranslated(context, "inappropriate_biography")??''),
                  Spacer(),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: AppColors.themeColor),
                    child: Checkbox(
                      value: false,
                      activeColor: AppColors.themeColor,
                      onChanged: (value) {
                        value = value!;
                        setState(() {});
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),


                ],
              ),

            ),
            SizedBox(height: Get.height*0.015,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(buttonText: 'no',
                    onpressed: (){
                      Get.back();

                    },
                    width: Get.width*0.35, isWhite: true),
                AppButton(buttonText: 'report', width: Get.width*0.35, isWhite: false, onpressed: (){Get.back();},)

              ],
            )

          ],

        ),
      ),
    );
  }
}
