import 'dart:math';

import 'package:amigos/helpers/bottom_sheets/edit_gender_bottomsheet.dart';
import 'package:amigos/helpers/widgets/notification_dialog.dart';
import 'package:amigos/helpers/widgets/prefrence_widget.dart';
import 'package:amigos/helpers/widgets/subcription_dialog.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/user_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/profile_detail_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
  bool isStar=false;
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, _) {
      return WillPopScope(
        onWillPop: (){
          return Future.value(false);
        },
        child: Scaffold(
          floatingActionButton: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                top: Get.width * 0.099, left: Get.width * 0.06,),
              child:  Container(
                height: Get.height*0.045,
                width: Get.width*0.1,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                // padding: EdgeInsets.only(top: 4,right: 4,bottom: 4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.black.withOpacity(0.5),
                          offset: Offset(0, 1),
                          blurRadius: 2)
                    ]
                ),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.black,
                      size: Get.width*0.045,
                    ),
                  ),
                ),
              ),
            ),
          ),
          body:Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.profilesBackground,),
                  fit: BoxFit.fill,
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
                      swipeAnchor: SwipeAnchor.top,
                      itemCount: provider.users.length,
                      stackClipBehaviour: Clip.antiAliasWithSaveLayer,
                      swipeAssistDuration: Duration(milliseconds: 100),
                      builder: (context, index, constraints) {
                        pageIndex=index;
                        return  ProfilesWidget(provider.users[index],provider);
                      },
                      onWillMoveNext: (index, direction) {
                        final allowedActions = [
                          SwipeDirection.right,
                          SwipeDirection.left,
                        ];
                        return allowedActions.contains(direction);
                      },
                      overlayBuilder: (
                          context,
                          constraints,
                          index,
                          direction,
                          swipeProgress,
                          ) {
                        final opacity = min(swipeProgress, 1.0);
                        final isRight = direction == SwipeDirection.right;
                        final isLeft = direction == SwipeDirection.left;
                        return Opacity(
                          opacity: isRight||isLeft ? opacity : 0,
                          child:isRight?Image.asset(AppImages.likeIcon,scale: 1,):Image.asset(AppImages.dislike,scale:1),
                        );
                      },
                      onSwipeCompleted:(int, SwipeDirection){
                        print("$int" );
                        if(controller.currentIndex==3||controller.currentIndex>3)
                        {
                          print(controller.currentIndex);
                          Get.dialog(
                              SubscriptionDialogBox()
                          );
                        }
                        if( isStar=isStar){
                          isStar=!isStar;
                          setState(() {

                          });
                        }
                      }
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
                        controller.currentIndex=0;
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
                        print(controller.currentIndex);
                        if(controller.currentIndex==3)
                        {
                          Get.dialog(
                              SubscriptionDialogBox()
                          );
                        }else
                        {
                          controller.next(
                              swipeDirection: SwipeDirection.right
                          );
                        }
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
                        if(controller.currentIndex==3)
                        {
                          Get.dialog(
                              SubscriptionDialogBox()
                          );
                        }else
                        {
                          controller.next(
                              swipeDirection: SwipeDirection.right
                          );
                        }
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
                        child: Image.asset(AppImages.heartGreen),
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        Get.dialog(
                            NotificationDialogBox()
                        );
                        isStar=!isStar;
                        provider.users[controller.currentIndex].favorite=true;
                        provider.update();
                        setState(() {

                        });
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
                        child: Image.asset(isStar?AppImages.starFill:AppImages.starBlank),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );},);
  }


  ProfilesWidget(UserModel user,DashboardProvider provider) {
    final _controller = PageController();
    return
      GestureDetector(
        onTap:(){
          Get.to(ProfileDetail(user:user));
        },
        child: Stack(
          children:[
            PageView(
              controller:_controller,
              children: [
                Image.asset(user.coverPhoto![0],fit: BoxFit.cover,),
                Image.asset(user.coverPhoto![1],fit: BoxFit.cover,),
                Image.asset(user.coverPhoto![2],fit: BoxFit.cover,),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: Get.height*0.3),
                child:SmoothPageIndicator(
                  count: 3,
                  effect: ExpandingDotsEffect(
                    expansionFactor: Get.width*0.01,
                    strokeWidth: Get.width*0.02,
                    dotColor: AppColors.white,
                    dotWidth: Get.width * 0.02,
                    dotHeight: Get.width * 0.02,
                    spacing: Get.width * 0.01,
                    activeDotColor: AppColors.white,
                  ),
                  controller: _controller,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top:Get.height*0.6),
                width: Get.width,
                padding: EdgeInsets.only(top: Get.height*0.03),
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
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Image.asset(AppImages.profile,scale: 5,),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: Get.width*0.02,),
                            Text(
                              user.name ?? "",
                              style: AppTextStyle.montserrat(
                                  AppColors.black3d, Get.width * 0.04, FontWeight.w500),
                            ),
                            const Text(','),
                            Text(
                              user.age.toString(),
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

                              decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.greenActive,
                              ),
                            ),
                            SizedBox(width: Get.width*0.02,),
                            Text(user.activeStatus, style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width * 0.04, FontWeight.w500),),
                          ],
                        ),
                        SizedBox(height: Get.width*0.02,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(AppImages.locationEvent,scale: 3,),
                            SizedBox(width: Get.width*0.01,),
                            Text(user.distance.toString(),style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width * 0.04, FontWeight.w500),),
                            Text(getTranslated(context,"miles_away",)??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width * 0.04, FontWeight.w500),),
                          ],
                        ),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:
                          List.generate(
                              user.intrests!.where((element) => element.isSelected==true).length,

                                  (index) {
                                List userlist=user.intrests!.where((element) => element.isSelected==true).toList();
                                return PrefrenceWidget(preference:userlist[index] ,);
                              }),

                        ),
                        SizedBox(height: Get.width*0.03,),
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
