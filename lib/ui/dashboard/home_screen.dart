import 'package:amigos/helpers/bottom_sheets/ticketbuy_bottomsheet.dart';
import 'package:amigos/helpers/widgets/event_description_widget.dart';
import 'package:amigos/helpers/widgets/event_widget.dart';
import 'package:amigos/helpers/widgets/getplan_dialog.dart';
import 'package:amigos/helpers/widgets/mood_wideget.dart';
import 'package:amigos/helpers/widgets/ticket_dialog.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/event_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/List_view.dart';
import 'package:amigos/ui/dashboard/all_events.dart';
import 'package:amigos/ui/dashboard/notification_screen.dart';
import 'package:amigos/ui/dashboard/map_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex=0;
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder:(context,provider,_)
    {
      return GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Scaffold(
          floatingActionButton: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:  EdgeInsets.only(top: Get.height*0.1,left:Get.width*0.08,right: Get.width*0.02,),
              child: Row(
                children: [
                  Container(
                    height: Get.width*0.09,
                    width: Get.width*0.3,
                    // margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(

                        boxShadow: [
                          BoxShadow(color: AppColors.black.withOpacity(0.1),offset:Offset(-15,-1),blurRadius:10  )
                        ]
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            pageIndex=0;
                            setState(() {
                            });
                            _controller.jumpToPage(pageIndex);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: Get.width*0.02,vertical: 2),
                            decoration: BoxDecoration(
                              color: pageIndex==1?AppColors.whiteColor:AppColors.themeColor,
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),
                            ),
                            child: pageIndex==0?Image.asset( AppImages.yourLocation2,):
                            Padding(   padding: EdgeInsets.all(1),child: Image.asset(AppImages.yourLocation),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            pageIndex=1;
                            setState(() {

                            });
                            _controller.jumpToPage(pageIndex);
                          },
                          child: Container(
                            padding: EdgeInsets.all(Get.width*0.035),
                            decoration: BoxDecoration(
                              color: pageIndex==1?AppColors.themeColor:AppColors.whiteColor,
                              borderRadius: const BorderRadius.only(topRight: Radius.circular(16),bottomRight: Radius.circular(16)),

                            ),
                            child: Image.asset(AppImages.list,color:pageIndex==0?AppColors.black:AppColors.whiteColor,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap:(){
                        Get.dialog(
                            MoodWidget()
                        );
                      },
                      child: Container(
                        height: Get.width*0.09,
                        width: Get.width*0.08,
                        padding: EdgeInsets.all(Get.width*0.015),
                        margin: EdgeInsets.only(right: 14),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.whiteColor,
                            boxShadow: [
                              BoxShadow(color: AppColors.opacBlack,blurRadius: 5)
                            ]
                        ),

                        child: Image.asset(provider.mood,height: Get.height*0.075,width: Get.width*0.06,),
                      )
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>  NotificationScreen());
                    },
                    child: Container(
                      height: Get.width*0.09,
                      width: Get.width*0.08,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(color: AppColors.opacBlack,blurRadius: 5)
                          ]
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.asset(AppImages.noNotification,),
                          provider.notifications.any((element) => element.isSeen==false)?Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              // width: Get.width*0.03,
                              // height: Get.width*0.03,
                              margin: EdgeInsets.only(bottom: 22,left: 12,top:4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                          ):SizedBox()
                        ],
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
          body: PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              MapScreen(),
              ListViewScreen(),
            ],
            onPageChanged: (index){
              pageIndex=index;
              setState(() {

              });
            },
          ),
        ),
      );
    });
    
  }
}
