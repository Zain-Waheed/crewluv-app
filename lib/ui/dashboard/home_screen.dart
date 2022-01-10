import 'package:amigos/helpers/bottom_sheets/ticketbuy_bottomsheet.dart';
import 'package:amigos/helpers/widgets/event_description_widget.dart';
import 'package:amigos/helpers/widgets/event_widget.dart';
import 'package:amigos/helpers/widgets/getplan_dialog.dart';
import 'package:amigos/helpers/widgets/mood_wideget.dart';
import 'package:amigos/helpers/widgets/ticket_dialog.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/event_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/all_events.dart';
import 'package:amigos/ui/dashboard/notification_screen.dart';
import 'package:amigos/ui/dashboard/sample_screen.dart';
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
        floatingActionButton: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding:  EdgeInsets.only(top: Get.width*0.04,left:Get.width*0.1,right: Get.width*0.04, ),
            child: Row(
              children: [
                Container(
                  height: Get.width*0.1,
                  width: Get.width*0.3,
                  margin: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(

                      boxShadow: [
                        BoxShadow(color: AppColors.black.withOpacity(0.1), offset: const Offset(0, 1), blurRadius: 12.0)
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
                          child: Image.asset(pageIndex==0? AppImages.yourLocation2:AppImages.yourLocation,),
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
                          padding: EdgeInsets.symmetric(vertical:Get.width*0.03,horizontal: Get.width*0.02),
                          decoration: BoxDecoration(
                            color: pageIndex==1?AppColors.themeColor:AppColors.whiteColor,
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(16),bottomRight: Radius.circular(16)),

                          ),
                          child: Image.asset(AppImages.list,scale: 2.7,color:pageIndex==0?AppColors.black:AppColors.whiteColor,),
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
                    child: Image.asset(AppImages.party2,width: Get.width*0.12,height: Get.width*0.32,)
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(()=> const NotificationScreen());
                  },
                  child: Image.asset(AppImages.notificationIcon,width: Get.width*0.12,height: Get.width*0.32,),
                ),
              ],
            ),
          ),
        ),
        body: PageView(
          controller: _controller,
          children: [
            MaoScreen(),
            Padding(
              padding: EdgeInsets.only(top:Get.width*0.25),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(provider.events.length, (index) => GestureDetector(
                      onTap: (){
                        Get.dialog(EventWidget(user: provider.users.first, event :provider.events.first ));
                      },
                      child: EventDescriptionWidget(model: provider.events[index],titleImage: true,))),
                ),
              ),
            ),
          ],
          onPageChanged: (index){
            pageIndex=index;
            setState(() {

            });
          },
        ),
      );
    });
    
  }
}
