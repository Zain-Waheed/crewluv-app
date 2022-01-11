import 'package:amigos/helpers/widgets/mood_wideget.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/all_events.dart';
import 'package:amigos/ui/dashboard/chat_screen.dart';
import 'package:amigos/ui/dashboard/create_event.dart';
import 'package:amigos/ui/dashboard/home_screen.dart';
import 'package:amigos/ui/dashboard/profile_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
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
          height: Get.height * 0.1,
          width: Get.width * 0.17,
          child: FloatingActionButton(
            child: Center(
                child: Image.asset(
              AppImages.addEvent,
              scale: 2.5,
              color: AppColors.whiteColor,
            )),
            backgroundColor: AppColors.themeColor,
            elevation: 2.0,
            onPressed: () {
              Get.to(() => CreateEvent(
                    comingFromEdit: false,
                  ));
            },
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: BottomAppBar(
            clipBehavior: Clip.antiAlias,
            child: Container(
              height: Get.width * 0.17,
              padding: EdgeInsets.all(Get.width * 0.01),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(0.5),
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
                        scale: 3.2,
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
                        scale: 3.2,
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
                    scale: 3,
                    color: Colors.transparent,
                  ),
                  GestureDetector(
                      onTap: () {
                        provider.dashboardIndex = 2;
                        provider.update();
                      },
                      child: Image.asset(AppImages.chat2,
                          scale: 3.2,
                          color: provider.dashboardIndex == 2
                              ? AppColors.themeColor
                              : AppColors.slateGrey)),
                  GestureDetector(
                      onTap: () {
                        provider.dashboardIndex = 3;
                        provider.update();
                      },
                      child: Image.asset(AppImages.user,
                          scale: 3.2,
                          color: provider.dashboardIndex == 3
                              ? AppColors.themeColor
                              : AppColors.slateGrey)),
                ],
              ),
            ),
            shape: const CircularNotchedRectangle(),
            elevation: 10,
            notchMargin: 7,
          ),
        ),
      );
    });
  }
}
