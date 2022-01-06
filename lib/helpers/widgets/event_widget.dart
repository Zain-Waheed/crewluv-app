import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/crew_members_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/event_model.dart';
import 'package:amigos/models/user_model.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventWidget extends StatefulWidget {
  final UserModel user;
  final EventModel event;

  EventWidget({required this.user, required this.event});


  @override
  _EventWidgetState createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  bool iswhite=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.opacBlack,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),

          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(AppImages.profile,scale: 4,),
                  SizedBox(width: Get.width*0.02,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.user.name ?? "",
                            style: AppTextStyle.montserrat(
                                AppColors.black3d, Get.width * 0.04, FontWeight.w500),
                          ),
                          const Text(','),
                          Text(
                            widget.user.age.toString(),
                            style: AppTextStyle.montserrat(
                                AppColors.black3d, Get.width * 0.04, FontWeight.w500),
                          ),
                          SizedBox(width: Get.width*0.04,),
                          widget.user.isVerified
                              ? Image.asset(AppImages.verified,scale: 3,)
                              : SizedBox(),
                        ],
                      ),
                      SizedBox(height: Get.width*0.01,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: Get.width*0.028,
                            width: Get.width*0.028,
                            decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.greenActive,
                            ),
                          ),
                          SizedBox(width: Get.width*0.02,),
                          Text(widget.user.activeStatus, style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width * 0.04, FontWeight.w500),),
                        ],
                      ),
                      SizedBox(height: Get.width*0.02,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                             Image.asset(AppImages.locationEvent,scale: 3,),
                             SizedBox(width: Get.width*0.01,),
                             Text(widget.user.distance.toString(),style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width * 0.04, FontWeight.w500),),
                             Text(getTranslated(context,"miles_away",)??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width * 0.04, FontWeight.w500),),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset(AppImages.bonFire,scale: 1.5,),

                ],
              ),
              SizedBox(height: Get.width*0.1,),
              Text(widget.event.title??"",style: AppTextStyle.montserrat(AppColors.black,Get.width*0.04,FontWeight.w700),),
              SizedBox(height: Get.width*0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: Get.width*0.02,horizontal: Get.width*0.03),
                    margin: EdgeInsets.symmetric(vertical: Get.width*0.02),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(widget.event.day??"",style: AppTextStyle.montserrat(AppColors.themeColor, Get.width*0.035, FontWeight.w700),),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: Get.width*0.02,horizontal: Get.width*0.03),
                    margin: EdgeInsets.symmetric(vertical: Get.width*0.02,horizontal: Get.width*0.02),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text("${widget.event.startTime}-${widget.event.endTime} ",style: AppTextStyle.montserrat(AppColors.themeColor, Get.width*0.035, FontWeight.w700),),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: Get.width*0.02,horizontal: Get.width*0.03),
                    margin: EdgeInsets.symmetric(vertical: Get.width*0.02),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text("${widget.event.distance}  ${getTranslated(context, "km")}",style: AppTextStyle.montserrat(AppColors.themeColor, Get.width*0.035, FontWeight.w700),),
                  ),

                ],

              ),
              SizedBox(height: Get.width*0.01,),
              Text(widget.event.description??"",style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.035, FontWeight.w400),),
              SizedBox(height: Get.width*0.04,),
              Row(
                children: [
                  Text(getTranslated(context,'my_crew')??'',style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w700),),
                  Spacer(),
                  Stack(
                    children: [
                      CrewMembersWidget(margin: 0, image:AppImages.crew1),
                      CrewMembersWidget(margin:25, image:AppImages.crew2),
                      Container(
                          margin: EdgeInsets.only(left: 60, top: 7.5),
                          decoration: BoxDecoration(
                              color: AppColors.grey,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.whiteColor)),
                          height:35,
                          width: 35,
                          child: Center(
                            child: Text(
                              "+${widget.event.maxFriends}",
                              style: AppTextStyle.montserrat(AppColors.whiteColor,Get.width*0.04,FontWeight.w500),
                            ),
                          )),
                    ],
                  ),
                  Text("${widget.event.withFriends}${getTranslated(context, 'of')} ${widget.event.maxFriends} ${getTranslated(context, "friends")} "),
                ],
              ),
              SizedBox(height: Get.width*0.07,),
              AppButton(buttonText:widget.event.personalEvent==true?'join': widget.event.entryType??'', onpressed: (){}, width: Get.width, isWhite: iswhite)
            ],
          ),
        ),
      ),
    );
  }
}
