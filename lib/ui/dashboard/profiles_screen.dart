import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/app_button_small.dart';
import 'package:amigos/helpers/widgets/notification_dialog.dart';
import 'package:amigos/helpers/widgets/prefrence_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/profile_detail_screen.dart';
import 'package:amigos/ui/dashboard/test_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profiles extends StatefulWidget {
  const Profiles({Key? key}) : super(key: key);

  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  final controller = SwipableStackController();
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, _) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(
            top: Get.width * 0.099, left: Get.width * 0.06,),
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.black.withOpacity(0.5),
                        offset: Offset(0, 4),
                        blurRadius: 5.0)
                  ]
              ),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.black,
                ),
              ),
            ),
            onPressed: () {  },
          ),
        ),
      ),
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.profilesBackground),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height*0.83,
              width: Get.width,
              child: SwipableStack(
                controller:controller,
                itemCount: 6,
                stackClipBehaviour: Clip.antiAliasWithSaveLayer,
                builder: (context, index, constraints) {
                  return  ProfilesWidget(provider);
                },
                onWillMoveNext: (index, direction) {
                  final allowedActions = [
                    SwipeDirection.right,
                    SwipeDirection.left,
                  ];
                  return allowedActions.contains(direction);
                },
              ),
            ),
            SizedBox(
              height: Get.width*0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap:(){
                    controller.rewind();
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: Get.width*0.04,top: Get.height*0.03),
                    width:Get.width*0.14,
                    height:Get.width*0.14,
                    alignment: Alignment.center,
                    padding:  const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.black.withOpacity(0.5),
                            offset: Offset(0, 4),
                            blurRadius: 5.0)
                      ],
                    ),
                    child: Image.asset(AppImages.rewind,scale: 3,),
                  ),
                ),
                GestureDetector(
                  onTap:(){
                         controller.next(
                        swipeDirection: SwipeDirection.right
                         );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: Get.width*0.04),
                    width:Get.width*0.16,
                    height:Get.width*0.16,
                    alignment: Alignment.center,
                    padding:  const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.black.withOpacity(0.5),
                            offset: Offset(0, 4),
                            blurRadius: 5.0)
                      ],
                    ),
                    child: Image.asset(AppImages.close),
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    Get.dialog(
                        NotificationDialogBox()
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: Get.width*0.04),
                    width:Get.width*0.16,
                    height:Get.width*0.16,
                    alignment: Alignment.center,
                    padding:  const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.black.withOpacity(0.5),
                            offset: Offset(0, 4),
                            blurRadius: 5.0)
                      ],
                    ),
                    child: Image.asset(AppImages.heart),
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    Get.to(SlidingAnimation());
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: Get.width*0.04,top: Get.height*0.04),
                    width:Get.width*0.14,
                    height:Get.width*0.14,
                    alignment: Alignment.center,
                    padding:  const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.black.withOpacity(0.5),
                            offset: const Offset(0, 4),
                            blurRadius: 5.0)
                      ],
                    ),
                    child: Image.asset(AppImages.starBlank),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );},);
  }


  ProfilesWidget(DashboardProvider provider) {
    return
    GestureDetector(
      onTap:(){
        Get.to(ProfileDetail());
      },
      child: Stack(
        children:[
          Container(
            width: Get.width,
            padding: EdgeInsets.only(
              top: Get.width * 0.099, left: Get.width * 0.06,),
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppDummyData.profileDummy),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top:Get.height*0.6),
              height: Get.height*0.18,
              width: Get.width,
              padding: EdgeInsets.symmetric(vertical: Get.height*0.02),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.black.withOpacity(0.5),
                        offset: Offset(0, 4),
                        blurRadius: 5.0)
                  ]
              ),
              child:    Row(
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
                          SizedBox(width: Get.width*0.05,),
                          Text(
                            provider.users[0].name ?? "",
                            style: AppTextStyle.montserrat(
                                AppColors.black3d, Get.width * 0.04, FontWeight.w500),
                          ),
                          const Text(','),
                          Text(
                            provider.users[0].age.toString(),
                            style: AppTextStyle.montserrat(
                                AppColors.black3d, Get.width * 0.04, FontWeight.w500),
                          ),
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
                          Text(provider.users[0].activeStatus, style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width * 0.04, FontWeight.w500),),
                        ],
                      ),
                      SizedBox(height: Get.width*0.02,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(AppImages.locationEvent,scale: 3,),
                          SizedBox(width: Get.width*0.01,),
                          Text(provider.users[0].distance.toString(),style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width * 0.04, FontWeight.w500),),
                          Text(getTranslated(context,"miles_away",)??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width * 0.04, FontWeight.w500),),
                        ],
                      ),
                      SizedBox(height: Get.width*0.02,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PrefrenceWidget(preference: provider.interests[1],),
                          SizedBox(width: Get.width*0.02,),
                          PrefrenceWidget(preference: provider.interests[2],),
                          SizedBox(width: Get.width*0.02,),
                          PrefrenceWidget(preference: provider.interests[9],),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
