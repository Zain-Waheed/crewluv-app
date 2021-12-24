import 'package:amigos/helpers/widgets/event_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/event_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class MyEvents extends StatefulWidget {
  const MyEvents({Key? key}) : super(key: key);

  @override
  _MyEventsState createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder:(context,provider,_)
    {
      return Scaffold(
        appBar:AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          leadingWidth: Get.width*0.35,
          leading: Row(
            children: [
              GestureDetector(
                onTap: (){
                  Get.dialog(
                    EventWidget(event: provider.events[1],user: provider.users.first),
                  );
                },
                child: Container(
                  height: Get.width*0.1,
                  width: Get.width*0.3,
                  margin: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.genderBorder.withOpacity(0.2), offset: const Offset(0, 2), blurRadius: 2.0)
                      ]

                  ),
                  child: Row(
                    children: [
                      Container(

                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          border: Border.all(color: AppColors.genderBorder),
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),
                        ),
                        child: Image.asset(AppImages.yourLocation2,),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical:Get.width*0.03,horizontal: Get.width*0.01),
                        decoration: BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(16),bottomRight: Radius.circular(16)),

                        ),
                        child: Image.asset(AppImages.list,scale: 2.5,color: AppColors.whiteColor,),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          actions: [
            Image.asset(AppImages.message),
            Image.asset(AppImages.party2),
          ],
        ) ,
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(provider.events.length, (index) => eventWidget(provider.events[index])),
          ),
        ),
        floatingActionButton: Container(
          height: Get.width*0.19,
          width: Get.width*0.19,
          margin: EdgeInsets.only(bottom: Get.width*0.1),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.themeColor)
          ),
          child:  Column(
            children: [
              Image.asset(AppImages.addEvent,scale: 3,),
              Align(
                alignment: Alignment.topCenter,
                child: Text('New Event',style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.025, FontWeight.w500
                ),),
              )
            ],
          )
        ),

      );
    });
    
  }
  Widget eventWidget(EventModel model){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.width*0.03),
      padding: EdgeInsets.symmetric(horizontal: Get.width*0.02,vertical: Get.width*0.01),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColors.lightGrey.withOpacity(0.2), offset: Offset(0, 4), blurRadius: 5.0)
          ],
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
             children: [
               Text(model.title??"",style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w700),),
               Spacer(),
               Image.asset(model.titleImage??"",scale: 2.5,),
             ],
           ),
           Text(model.description??"",style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.035, FontWeight.w400),),
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Image.asset(AppImages.location,scale: 2.5,),
               Text('${model.distance}',style: AppTextStyle.montserrat(AppColors.eventBlack, Get.width*0.035, FontWeight.w400),),
               Text(getTranslated(context, "miles_away")??"",style: AppTextStyle.montserrat(AppColors.eventBlack, Get.width*0.035, FontWeight.w400)),
               Spacer(),
               Text(model.day??"",style: AppTextStyle.montserrat(AppColors.eventGrey, Get.width*0.03, FontWeight.w400)),
               SizedBox(width: 2,),
               Text(model.startTime??"",style: AppTextStyle.montserrat(AppColors.eventGrey, Get.width*0.03, FontWeight.w400))
             ],
           )
         ],
      ),
    );
  }
}
