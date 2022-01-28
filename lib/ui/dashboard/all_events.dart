import 'package:amigos/helpers/widgets/empty_screen_widget.dart';
import 'package:amigos/helpers/widgets/event_description_widget.dart';
import 'package:amigos/helpers/widgets/tabs_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/event_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/event_details.dart';
import 'package:amigos/ui/dashboard/pending%20_event_detail_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

int allEventsIndex = 0;
PageController allEventsController = PageController();

class AllEvents extends StatefulWidget {
  const AllEvents({Key? key}) : super(key: key);

  @override
  _AllEventsState createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  List<bool> selected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, _) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: AppColors.whiteBackground,
          appBar: AppBar(
            title: Text(
              getTranslated(context, "events") ?? "",
              style: AppTextStyle.montserrat(
                  AppColors.shadedBlack, Get.width * 0.04, FontWeight.w500),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.whiteColor,
          ),
          body: Column(
            children: [

              Container(
                height: Get.height*0.05,
                margin: EdgeInsets.symmetric(horizontal: Get.width*0.06),
                decoration: BoxDecoration(
                  color: AppColors.silverWhite,
                  border: Border.all(color: AppColors.genderBorder),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TabBar(
                  labelColor: AppColors.white,
                  labelStyle: AppTextStyle.montserrat(
                    Colors.transparent,
                    Get.width*0.04,
                    FontWeight.w400,
                  ),
                  unselectedLabelColor: AppColors.shadedBlack,
                  indicator: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.genderBorder),
                  ),
                  tabs: <Tab>[
                    Tab(
                      text: getTranslated(context, "my_events"),
                    ),
                    Tab(
                      text: getTranslated(context, "joined"),
                    ),
                    Tab(
                      text: getTranslated(context, "pending2"),
                    ),
                  ],
                  onTap: (x) {
                    if (x == 0) {
                      provider.allEventPageIndex = 0;
                      provider.update();
                      selected[0] = true;
                      selected[1] = selected[2] = false;
                    } else if (x == 1) {
                      provider.allEventPageIndex = 1;
                      provider.update();
                      selected[1] = true;
                      selected[0] = selected[2] = false;
                    } else {
                      provider.allEventPageIndex = 2;
                      provider.update();
                      selected[2] = true;
                      selected[1] = selected[0] = false;
                    }
                  },
                ),
                // child: ToggleButtons(
                //   borderRadius: BorderRadius.circular(30),
                //   borderColor: AppColors.black,
                //   constraints: BoxConstraints(
                //     maxHeight: Get.height * 0.05,
                //     minHeight: Get.height * 0.05,
                //     maxWidth: Get.width * 0.275,
                //     minWidth: Get.width * 0.237,
                //   ),
                //   renderBorder: false,
                //   onPressed: (x) {
                //     if (x == 0) {
                //       provider.allEventPageIndex = 0;
                //       provider.update();
                //       selected[0] = true;
                //       selected[1] = selected[2] = false;
                //     } else if (x == 1) {
                //       provider.allEventPageIndex = 1;
                //       provider.update();
                //       selected[1] = true;
                //       selected[0] = selected[2] = false;
                //     } else {
                //       provider.allEventPageIndex = 2;
                //       provider.update();
                //       selected[2] = true;
                //       selected[1] = selected[0] = false;
                //     }
                //   },
                //   isSelected: selected,
                //   children: [
                //     TabsWidget('my_events', selected[0]),
                //     TabsWidget('joined', selected[1]),
                //     TabsWidget('pending2', selected[2]),
                //   ],
                // ),
              ),

              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: IndexedStack(
                    index: provider.allEventPageIndex,
                    children: [
                      provider.events.isNotEmpty
                          ? ListView(
                              padding: EdgeInsets.only(bottom: Get.height * 0.15),
                              children: List.generate(
                                  provider.events.length,
                                  (index) => GestureDetector(
                                      onTap: () {
                                        Get.to(EventDetails(
                                          index: 0,
                                        ));
                                      },
                                      child: EventDescriptionWidget(
                                        model: provider.events[index],
                                        titleImage: false,
                                      ))),
                            )
                          : EmptyScreenWidget(
                              image: AppImages.noEvent,
                              title: 'no_event',
                              subtitle: 'no_event_yet'),
                      provider.events.isNotEmpty
                          ? ListView(
                              padding: EdgeInsets.only(bottom: Get.height * 0.15),
                              children: List.generate(
                                  provider.events.length,
                                  (index) => GestureDetector(
                                      onTap: () {
                                        Get.to(EventDetails(
                                          index: 1,
                                        ));
                                      },
                                      child: EventDescriptionWidget(
                                        model: provider.events[index],
                                        titleImage: false,
                                      ))),
                            )
                          : EmptyScreenWidget(
                              image: AppImages.noEvent,
                              title: 'no_joined_event',
                              subtitle: 'no_joined_event_yet'),
                      provider.events.where((element) => element.eventStatus==1).isNotEmpty
                          ? ListView(
                              padding: EdgeInsets.only(bottom: Get.height * 0.15),
                              children: List.generate(
                                  provider.events.where((element) => element.eventStatus==1).length,
                                  (index){
                                    List<EventModel> pendingEvents=provider.events
                                        .where((element) => element.eventStatus==1)
                                        .toList();
                                    return
                                   GestureDetector(
                                      onTap: () {
                                        Get.to(
                                             PendingEventDetail(user: pendingEvents[index].model!, event: pendingEvents[index],)
                                        //     EventDetails(
                                        //   index: 2,
                                        // )
                                        );
                                      },
                                      child: EventDescriptionWidget(
                                        model: pendingEvents[index],
                                        titleImage: false,
                                      ));}
                              ),
                      )
                          : EmptyScreenWidget(
                              image: AppImages.noEvent,
                              title: 'no_pending_event',
                              subtitle: 'no_pending_event_yet'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
