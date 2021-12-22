import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class EventSpecifications extends StatefulWidget {
  const EventSpecifications({Key? key}) : super(key: key);

  @override
  _EventSpecificationsState createState() => _EventSpecificationsState();
}

class _EventSpecificationsState extends State<EventSpecifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.width * 0.17),
        child: CustomAppBar(
          function: () {},
          backButton: false,
          title: 'new_event',
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: Get.width*0.02,horizontal: Get.width*0.07),
        color: AppColors.backGround,
        child: AppButton(
          width: Get.width*0.9,
          onpressed: (){},
          buttonText: 'Save_&_continue',
          isWhite: false,
        ) ,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width*0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.width*0.1,),
            Text(getTranslated(context, "with_people")??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),),
            SizedBox(height: Get.width*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(Icons.add,color: AppColors.whiteColor,),
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(5),

                  ),
                ),
                SizedBox(width: Get.width*0.03,),
                Container(
                  height: Get.width*0.07,
                  width: Get.width*0.25,
                  child: TextField(
                    decoration: AppInputDecoration.circularFieldDecoration(null, '0', null),
                  ),
                ),
                SizedBox(width: Get.width*0.03,),
                Container(
                  child:
                  Center(child: Icon(Icons.minimize,color: AppColors.whiteColor,)),
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(5),

                  ),
                )

              ],
            ),
            SizedBox(height: Get.width*0.05,),
            Text(getTranslated(context, "max_friends")??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),),
            SizedBox(height: Get.width*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(Icons.add,color: AppColors.whiteColor,),
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(5),

                  ),
                ),
                SizedBox(width: Get.width*0.03,),
                Container(
                  height: Get.width*0.07,
                  width: Get.width*0.25,
                  child: TextField(
                    decoration: AppInputDecoration.circularFieldDecoration(null, '0', null),
                  ),
                ),
                SizedBox(width: Get.width*0.03,),
                Container(
                  child:
                  Center(child: Icon(Icons.minimize,color: AppColors.whiteColor,)),
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(5),

                  ),
                )

              ],
            ),
            SizedBox(height: Get.width*0.05,),
            Text(getTranslated(context, "how_many_friends")??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),),
            SizedBox(height: Get.width*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(Icons.add,color: AppColors.whiteColor,),
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(5),

                  ),
                ),
                SizedBox(width: Get.width*0.03,),
                Container(
                  height: Get.width*0.07,
                  width: Get.width*0.25,
                  child: TextField(
                    decoration: AppInputDecoration.circularFieldDecoration(null, '0', null),
                  ),
                ),
                SizedBox(width: Get.width*0.03,),
                Container(
                  child:
                  Center(child: Icon(Icons.minimize,color: AppColors.whiteColor,)),
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(5),

                  ),
                )

              ],
            )


          ],
        ),
      ),
    );
  }
}
