import 'package:amigos/helpers/bottom_sheets/ticketbuy_bottomsheet.dart';
import 'package:amigos/helpers/widgets/event_description_widget.dart';
import 'package:amigos/helpers/widgets/event_widget.dart';
import 'package:amigos/helpers/widgets/mood_wideget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/event_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/all_events.dart';
import 'package:amigos/ui/dashboard/map_screen.dart';
import 'package:amigos/ui/dashboard/notification_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'create_event.dart';
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
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar:AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          leadingWidth: Get.width*0.35,
          leading: Row(
            children: [
              Container(
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
                    GestureDetector(
                      onTap: (){
                        pageIndex=0;
                        _controller.jumpToPage(pageIndex);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          border: Border.all(color: AppColors.genderBorder),
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),
                        ),
                        child: Image.asset(AppImages.yourLocation2,),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        pageIndex=1;
                        _controller.jumpToPage(pageIndex);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical:Get.width*0.03,horizontal: Get.width*0.01),
                        decoration: BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(16),bottomRight: Radius.circular(16)),

                        ),
                        child: Image.asset(AppImages.list,scale: 2.5,color: AppColors.whiteColor,),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          actions: [
            GestureDetector(
               onTap: (){
                   Get.to(()=> const NotificationScreen());
               },
                child: Image.asset(AppImages.notificationIcon),
            ),
            GestureDetector(
              onTap:(){
                Get.bottomSheet(
                  TicketBuy()
                );
              },
                child: Image.asset(AppImages.party2)
            ),
          ],
        ) ,
        body: PageView(
          controller: _controller,
          children: [
            MapScreen(),
            SingleChildScrollView(
              child: Column(
                children: List.generate(provider.events.length, (index) => EventDescriptionWidget(model: provider.events[index],titleImage: true,)),
              ),
            ),
          ],
          onPageChanged: (index){
            pageIndex=index;
          },
        ),
      );
    });
    
  }
}
