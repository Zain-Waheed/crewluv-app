import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
     appBar: PreferredSize(
       preferredSize: Size.fromHeight(Get.width*0.17),
       child: CustomAppBar(
       backButton: true,
       function: (){Get.back();},
       title: 'notifications',
       ),
     ),
      body: SingleChildScrollView(
        child: Column(
         children: List.generate(6, (index) => notificationWidget()),

        ),
      ),

    );
  }
  Widget notificationWidget(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical: Get.width*0.015),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
          boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.2),offset: const Offset(0,1),blurRadius: 2.0
          )
        ]

      ),

      child: ListTile(
        leading: Image.asset(AppImages.notification1),
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Text('Nelly,',style: AppTextStyle.montserrat(AppColors.greyDark, Get.width*0.04, FontWeight.w500),),
                  Text('38',style: AppTextStyle.montserrat(AppColors.greyDark, Get.width*0.04, FontWeight.w500),),
                ],
              ),
            ),
            Spacer(),
             Row(
                mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text('now',style: AppTextStyle.montserrat(AppColors.greyDark, Get.width*0.03, FontWeight.w400),),
               ],
             )
          ],
        ),
        subtitle: Text(AppDummyData.mediumText,maxLines: 2,overflow:TextOverflow.ellipsis ,),
        minVerticalPadding: 20,
       contentPadding: EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical: Get.width*0.01),
      ),
    );
  }
}
