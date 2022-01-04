import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/crew_members_widget.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/helpers/widgets/event_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EventDetails extends StatefulWidget {
  int index;

  EventDetails({Key? key, required this.index}) : super(key: key);

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context,provider,_){
      return Scaffold(
        backgroundColor: AppColors.backGround,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Get.width*0.17),
          child: CustomAppBar(
            function: (){Get.back();},
            title: "event_details",
            backButton: true,
          ),

        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),

                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.opacBlack,
                        offset: Offset(0,2),
                        blurRadius: 5
                      )
                    ]
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
                                    provider.users[0].name ?? "",
                                    style: AppTextStyle.montserrat(
                                        AppColors.black3d, Get.width * 0.04, FontWeight.w600),
                                  ),
                                  const Text(','),
                                  Text(
                                    provider.users[0].age.toString(),
                                    style: AppTextStyle.montserrat(
                                        AppColors.black3d, Get.width * 0.04, FontWeight.w600),
                                  ),
                                  SizedBox(width: Get.width*0.04,),
                                  provider.users[0].isVerified
                                      ? Image.asset(AppImages.verified,scale: 3,)
                                      : SizedBox(),
                                ],
                              ),
                              SizedBox(height: Get.width*0.02,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(AppImages.locationEvent,scale: 3,),
                                  SizedBox(width: Get.width*0.01,),
                                  Text(provider.users[0].distance.toString(),style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width * 0.04, FontWeight.w400),),
                                  Text(getTranslated(context,"miles_away",)??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width * 0.04, FontWeight.w400),),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Image.asset(AppImages.bonFire,scale: 1.5,),

                        ],
                      ),
                      SizedBox(height: Get.width*0.1,),
                      Text(provider.events[0].title??"",style: AppTextStyle.montserrat(AppColors.black,Get.width*0.04,FontWeight.w700),),
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
                            child: Text(provider.events[0].day??"",style: AppTextStyle.montserrat(AppColors.black, Get.width*0.035, FontWeight.w700),),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: Get.width*0.02,horizontal: Get.width*0.03),
                            margin: EdgeInsets.symmetric(vertical: Get.width*0.02,horizontal: Get.width*0.02),
                            decoration: BoxDecoration(
                              color: AppColors.themeColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text("${provider.events[0].startTime}-${provider.events[0].endTime} ",style: AppTextStyle.montserrat(AppColors.black, Get.width*0.035, FontWeight.w700),),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: Get.width*0.02,horizontal: Get.width*0.03),
                            margin: EdgeInsets.symmetric(vertical: Get.width*0.02),
                            decoration: BoxDecoration(
                              color: AppColors.themeColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text("${provider.events[0].distance}  ${getTranslated(context, "km")}",style: AppTextStyle.montserrat(AppColors.black, Get.width*0.035, FontWeight.w700),),
                          ),

                        ],

                      ),
                      SizedBox(height: Get.width*0.01,),
                      Text(provider.events[0].description??"",style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.035, FontWeight.w400),),
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
                                      "+${provider.events[0].maxFriends}",
                                      style: AppTextStyle.montserrat(AppColors.whiteColor,Get.width*0.04,FontWeight.w500),
                                    ),
                                  )),
                            ],
                          ),
                          Text("${provider.events[0].withFriends}${getTranslated(context, 'of')} ${provider.events[0].maxFriends} ${getTranslated(context, "friends")} "),
                        ],
                      ),
                    ],
                  ),
                ),

              ),
              SizedBox(height: Get.width*0.07,),
              AppButton(buttonText: 'view_request', onpressed: (){}, width: Get.width, isWhite: true),
            ],


          ),
        ),
        bottomNavigationBar: widget.index!=2?Container(
          padding:EdgeInsets.symmetric(vertical: 15,horizontal: 10),
          child:AppButton(buttonText: widget.index==1?'edit2':'pending' , onpressed: (){}, width: Get.width, isWhite: false),
        ):SizedBox(),
      );

    },);
  }
}
