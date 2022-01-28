import 'package:amigos/helpers/widgets/mood_wideget.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/all_events.dart';
import 'package:amigos/ui/dashboard/chat_screen.dart';
import 'package:amigos/ui/dashboard/create_event.dart';
import 'package:amigos/ui/dashboard/home_screen.dart';
import 'package:amigos/ui/dashboard/new_crew.dart';
import 'package:amigos/ui/dashboard/profile_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';




class DashBoard extends StatefulWidget {
  bool isDialog;
  bool comingFromList;
   DashBoard({Key? key,this.isDialog=false,this.comingFromList=false}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  PageController controller = PageController();
  int pageIndex=0;
  List <String> icons=[
    AppImages.home,
    AppImages.people,
    AppImages.chat2,
    AppImages.user,
  ];
  int currentTab=0;
  DateTime? currentBackPressTime;
  @override
  void initState() {
    super.initState();
    if(widget.isDialog==true)
      {
        Future.delayed(Duration(seconds: 3), () {
          Get.dialog(MoodWidget());
        });
      }
    // else     if(widget.comingFromList==true)
    //     {
    //       currentTab=2;
    //     }
    Provider.of<DashboardProvider>(context,listen:false).getCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {
    return
    Consumer<DashboardProvider>(builder: (context,provider,_){
      return Scaffold(
        extendBody: true,
          backgroundColor: AppColors.whiteColor,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FittedBox(
            child: SizedBox(
              height: 80,
              width: 80,
              child: FloatingActionButton(
                     child: Container(
                       decoration: BoxDecoration(
                         gradient: AppColors.buttonGradientColor,
                         shape: BoxShape.circle,
                       ),
                       child: Center(
                           child: Image.asset(
                             AppImages.addEvent,
                             height: Get.height * 0.045,
                             width: Get.width * 0.7,
                             color: AppColors.whiteColor,
                           )),
                     ),
                elevation: 2,
                onPressed: () {
                  currentTab==2
                      ? Get.to(() => NewCrew())
                      : Get.to(() => CreateEvent(
                    comingFromEdit: false,
                  )
                  );
                },
              ),
            ),
          ),
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: 4,
            activeIndex: currentTab,
            gapLocation: GapLocation.center,
            splashSpeedInMilliseconds: 1,
            notchSmoothness: NotchSmoothness.sharpEdge,
            backgroundColor: AppColors.whiteColor,
            notchMargin: 5,
            height: 50,
            rightCornerRadius: 30,
            leftCornerRadius: 30,
            tabBuilder: (int index, bool isActive) {
              return Center(
                child:
                  index==2?
                      Stack(
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: Image.asset(icons[index],
                                scale: 3.5,
                                color: isActive ? AppColors.themeColor :null,
                              )
                          ),
                          provider.personalChats.any((element) => element.seen == false && index == 2 && provider.chatPageIndex == 0)?
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 10,
                                width: 10,
                                margin: EdgeInsets.only(left: Get.width*0.05,top: Get.height*0.004),
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red),
                              ),
                            ),
                          ):SizedBox(),
                        ],
                      ):Image.asset(icons[index],scale: 3.5, color: isActive ? AppColors.themeColor :null,),
              );
            },
            onTap: (index) => setState(() {
              currentTab = index;
              controller.jumpToPage(index);
            }),
          ),
        body: PageView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomeScreen(),
            AllEvents(),
            ChatScreen(),
            ProfileScreen(),
          ],
        ),
      );
    });
  }
}
