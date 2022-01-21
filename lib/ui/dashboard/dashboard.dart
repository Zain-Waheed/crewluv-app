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

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<String> icons = [
    AppImages.home,
    AppImages.people,
    AppImages.chat,
    AppImages.user
  ];
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Get.dialog(MoodWidget());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, _) {
      return Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: provider.dashboardIndex,
          children: const [
            HomeScreen(),
            AllEvents(),
            ChatScreen(),
            ProfileScreen(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: Get.height * 0.12,
          width: Get.width * 0.18,
          child: FloatingActionButton(
            child: Center(
                child: Image.asset(
              AppImages.addEvent,
              height: Get.height * 0.04,
              width: Get.width * 0.7,
              color: AppColors.whiteColor,
            )),
            backgroundColor: AppColors.themeColor,
            elevation: 2,
            onPressed: () {
              provider.dashboardIndex != 2
                  ? Get.to(() => CreateEvent(
                        comingFromEdit: false,
                      ))
                  : Get.to(() => NewCrew());
            },
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: BottomAppBar(
            clipBehavior: Clip.antiAlias,
            child: Container(
              height: Get.width * 0.17,
              padding: EdgeInsets.all(Get.width * 0.01),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(0.9),
                      offset: const Offset(0, 2),
                      blurRadius: 5.0)
                ],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: AppColors.whiteColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.dashboardIndex = 0;
                      provider.update();
                    },
                    child: Image.asset(AppImages.home,
                        height: Get.height * 0.05,
                        width: Get.width * 0.05,
                        color: provider.dashboardIndex == 0
                            ? AppColors.themeColor
                            : AppColors.slateGrey),
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.dashboardIndex = 1;
                      provider.update();
                    },
                    child: Image.asset(AppImages.people,
                        height: Get.height * 0.08,
                        width: Get.width * 0.09,
                        color: provider.dashboardIndex == 1
                            ? AppColors.themeColor
                            : AppColors.slateGrey),
                  ),
                  Image.asset(
                    AppImages.user,
                    scale: 3,
                    color: Colors.transparent,
                  ),
                  Image.asset(
                    AppImages.user,
                    color: Colors.transparent,
                  ),
                  GestureDetector(
                      onTap: () {
                        provider.dashboardIndex = 2;
                        provider.update();
                      },
                      child: Container(
                          height: Get.height * 0.5,
                          width: Get.width * 0.09,
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    AppImages.chat2,
                                    height: Get.height * 0.6,
                                    width: Get.width * 0.07,
                                    color: provider.dashboardIndex==2?AppColors.themeColor:AppColors.slateGrey,
                                  )),
                              provider.personalChats.any((element) =>
                                      element.seen == false &&
                                      provider.dashboardIndex == 2 &&
                                      provider.chatPageIndex == 0)
                                  ? Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        height: 10,
                                        width: 10,
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ))),
                  GestureDetector(
                      onTap: () {
                        provider.dashboardIndex=3;
                        provider.update();
                      },
                      child: Image.asset(AppImages.user,
                          height: Get.height * 0.05,
                          width: Get.width * 0.05,
                          color: provider.dashboardIndex == 3
                              ? AppColors.themeColor
                              : AppColors.slateGrey)),
                ],
              ),
            ),
            shape: const CircularNotchedRectangle(),
            elevation: 0,
            notchMargin: 7,
          ),
        ),
      );
    });
  }
}
