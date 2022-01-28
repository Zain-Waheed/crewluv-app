import 'dart:developer';

import 'package:amigos/helpers/bottom_sheets/congratulation_bottomsheet.dart';
import 'package:amigos/helpers/bottom_sheets/report_bottomsheet.dart';
import 'package:amigos/helpers/widgets/crew_members_widget.dart';
import 'package:amigos/helpers/widgets/empty_screen_widget.dart';
import 'package:amigos/helpers/widgets/tabs_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/group_chat_model.dart';
import 'package:amigos/models/personal_chat_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/chat_details.dart';
import 'package:amigos/ui/dashboard/dashboard.dart';
import 'package:amigos/ui/dashboard/group_chat_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


int chatIndex = 0;
PageController chatController = PageController();
class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>  with TickerProviderStateMixin{
  List<bool> selected=[true,false];

  @override
  Widget build(BuildContext context)  {
    return Consumer<DashboardProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            getTranslated(context, 'messages') ?? "",
            style: AppTextStyle.montserrat(
                AppColors.shadedBlack, Get.width * 0.04, FontWeight.w500),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.genderBorder),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(20),
                fillColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                constraints: BoxConstraints(
                  maxHeight: Get.height*0.05,
                  minHeight: Get.height*0.05,
                  maxWidth: Get.width*0.275,
                  minWidth: Get.width*0.237,

                ),renderBorder: false,
                isSelected: selected,
                onPressed: (x){
                  if(x==0){
                    provider.chatPageIndex=0;
                    provider.update();
                    selected[0]=true;
                    selected[1]=false;

                  }
                  else{
                    provider.chatPageIndex=1;
                    provider.update();
                    selected[1]=true;
                    selected[0]=false;

                  }
                },
                children: [
                 TabsWidget("chats", selected[0]),
                  TabsWidget("my_crew", selected[1]),


                ],
              ),
            ),
            SizedBox(height: Get.height*0.02,),
            Expanded(
              child: IndexedStack(
                index: provider.chatPageIndex,
                children: [
                  provider.personalChats.isNotEmpty?
                  SlidableAutoCloseBehavior(
                    child: ListView(
                      padding: EdgeInsets.only(bottom: Get.height*0.1),
                      children: List.generate(provider.personalChats.length,
                          (index) {
                        return Slidable(
                            key:  ValueKey(index),
                            groupTag: "0",
                            endActionPane:  ActionPane(
                              extentRatio: 0.28,
                              motion: const ScrollMotion(),
                              children: [
                                GestureDetector (
                                  onTap: (){
                                    Get.bottomSheet(ReportBottomSheet(),isScrollControlled: true);
                                  },
                                  child: Container(
                                      width:Get.width*0.1,
                                      height:Get.width*0.1,
                                      margin:EdgeInsets.only(left: Get.width*0.02),
                                      decoration:  BoxDecoration(
                                        color: AppColors.themeColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child:Icon(Icons.flag,color: AppColors.whiteColor,)
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {

                                    });
                                    SlidableController(this).dismissGesture;
                                    provider.personalChats.removeAt(index);
                                    // DismissiblePane(onDismissed: () {});
                                  },
                                  child: Container(
                                    width:Get.width*0.1,
                                    height:Get.width*0.1,
                                    margin:EdgeInsets.only(left: Get.width*0.02),
                                    decoration:  BoxDecoration(
                                      color: AppColors.soberRed,
                                      shape: BoxShape.circle,
                                    ),
                                    child:Icon(
                                      Icons.delete,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            child: personalChatItemWidget(index,provider.personalChats[index]));
                          }

                      ),
                    ),
                  )
                      :EmptyScreenWidget(image: AppImages.noChat, title: 'no_chat',subtitle: 'no_chat_yet'),


                  provider.groupChats.isNotEmpty? ListView(
                    padding: EdgeInsets.only(bottom: Get.height*0.1),
                    children: List.generate(
                        provider.groupChats.length,
                        (index) =>
                            groupChatItemWidget(provider.groupChats[index])),
                  ):EmptyScreenWidget(image: AppImages.noChat, title: 'no_crew',subtitle: 'no_crew_yet'),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget personalChatItemWidget(int index,PersonalChatModel model) {
    return Consumer<DashboardProvider>(builder: (context,provider,_){
      return Card(
        elevation: 0,
        margin: EdgeInsets.all(5),
        child: ListTile(
          selected: !model.seen,
          selectedTileColor: AppColors.skyblue,
          contentPadding: EdgeInsets.all(5),
          leading:Container(
            height: Get.height*0.13,
            width: Get.width*0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                model.seen==false?Container(
                  height: Get.height*.13,
                  width: Get.width*0.01,
                  color: AppColors.themeColor,
                ):const SizedBox(),
                Container(
                  height: Get.height * 0.13,
                  width: Get.width * 0.18,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: AppColors.themeColor,
                        width: 2),
                    color: AppColors.white,
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        model.imagePath,
                        scale: 0.5,
                        fit: BoxFit.contain,
                        height: Get.width * 0.23,
                        width: Get.width * 0.23,
                      ),
                      model.isFavourite??false?Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset(AppImages.starFill,height: Get.height*0.03,width: Get.width*0.05,)):SizedBox(),
                    ],

                  ),
                ),
              ],
            ),
          ),
          title: Row(
            children: [
              Text(
                model.name,
                style: AppTextStyle.montserrat(
                    AppColors.shadedBlack, Get.width * 0.04, FontWeight.w400),
              ),
              const Spacer(),
              Text(
                model.time,
                style: AppTextStyle.montserrat(
                    AppColors.lightGrey, Get.width * 0.03, FontWeight.w400),
              ),
            ],
          ),
          minLeadingWidth: Get.width*0.25,
          horizontalTitleGap: 0,
          subtitle: Container(
              margin: EdgeInsets.symmetric(vertical: Get.width * 0.01),
              child: Text(
                  model.lastMessage,
                  style: AppTextStyle.montserrat(
                      AppColors.greyDark, Get.width * 0.035, FontWeight.w400),maxLines: 2,overflow: TextOverflow.ellipsis
              )),
          onTap: () {
            log(index.toString()+"dusisbdsudusudsuiusiuisd");
            model.seen=true;
            provider.update();
            setState(() {

            });

           Get.to(() => ChatDetails(name: model.name));
          },
        ),
      );


    },);
  }
  Widget groupChatItemWidget(GroupChatModel model,) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child:  ListTile(
        leading: Stack(
          children: [
            CrewMembersWidget(margin: 0, image: AppImages.crew1),
            CrewMembersWidget(margin: 10, image: AppImages.crew2),
            Container(
                margin: EdgeInsets.only(left: 30, top: 7.5),
                decoration: BoxDecoration(
                    color: AppColors.coalGrey,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.whiteColor)),
                height: 35,
                width: 35,
                child: Center(
                  child: Text(
                    "+9",
                    style: AppTextStyle.montserrat(
                        AppColors.whiteColor,
                        Get.width * 0.035,
                        FontWeight.w500),
                  ),
                )),
          ],
        ),
        title: Row(
          children: [
            Text(
              model.chatName,
              style: AppTextStyle.montserrat(
                  AppColors.shadedBlack, Get.width * 0.04, FontWeight.w400),
            ),
            const Spacer(),
            Text(
              model.date,
              style: AppTextStyle.montserrat(
                  AppColors.lightGrey, Get.width * 0.03, FontWeight.w400),
            ),
          ],
        ),
        subtitle: Container(
            margin: EdgeInsets.symmetric(vertical: Get.width * 0.01),
            child: Text(
              '${model.lastMessageSender}:${model.lastMessage}',
              style: AppTextStyle.montserrat(
                  AppColors.greyDark, Get.width * 0.035, FontWeight.w400),maxLines: 2,overflow: TextOverflow.ellipsis,)
        ),
        onTap: () {
          Get.to(() =>
              GroupChat(name: model.chatName)
          );
        },
      ),
    );
  }

}

class ChatCard extends StatefulWidget {
  final int index;
  final DashboardProvider provider;
  const ChatCard({required this.index,required this.provider,Key? key}) : super(key: key);

  @override
  _ChatCardState createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
        groupTag: widget.index.toString(),
        key: ValueKey(widget.index),
        endActionPane:  ActionPane(
          extentRatio: 0.5,
          motion: const ScrollMotion(),
          children: [
            // SlidableAction(
            //   onPressed: (value){
            //
            //   },
            //   backgroundColor: Color(0xFFFE4A49),
            //   foregroundColor: Colors.white,
            //   icon: Icons.delete,
            //   label: 'Delete',
            //
            // ),
            // SlidableAction(
            //   onPressed: null,
            //   backgroundColor: Color(0xFF21B7CA),
            //   foregroundColor: Colors.white,
            //   icon: Icons.share,
            //   label: 'Share',
            // ),
            GestureDetector (
              onTap: (){
                Get.bottomSheet(ReportBottomSheet(),isScrollControlled: true);
              },
              child: Container(
                  width:Get.width*0.1,
                  height:Get.width*0.1,
                  margin:EdgeInsets.only(left: Get.width*0.02),
                  decoration:  BoxDecoration(
                    color: AppColors.themeColor,
                    shape: BoxShape.circle,
                  ),
                  child:Icon(Icons.flag,color: AppColors.whiteColor,)
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {

                });
               widget.provider.personalChats.removeAt(widget.index);
              },
              child: Container(
                width:Get.width*0.1,
                height:Get.width*0.1,
                margin:EdgeInsets.only(left: Get.width*0.02),
                decoration:  BoxDecoration(
                  color: AppColors.soberRed,
                  shape: BoxShape.circle,
                ),
                child:Icon(
                  Icons.delete,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
        child: personalChatItemWidget(widget.provider.personalChats[widget.index]));
  }
  Widget personalChatItemWidget(PersonalChatModel model) {
    return Consumer<DashboardProvider>(builder: (context,provider,_){
      return Card(
        elevation: 0,
        margin: EdgeInsets.all(5),
        child: ListTile(
          selected: !model.seen,
          selectedTileColor: AppColors.skyblue,
          contentPadding: EdgeInsets.all(5),
          leading:Container(
            height: Get.height*0.13,
            width: Get.width*0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                model.seen==false?Container(
                  height: Get.height*.13,
                  width: Get.width*0.01,
                  color: AppColors.themeColor,
                ):const SizedBox(),
                Container(
                  height: Get.height * 0.13,
                  width: Get.width * 0.18,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: AppColors.themeColor,
                        width: 2),
                    color: AppColors.white,
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        model.imagePath,
                        scale: 0.5,
                        fit: BoxFit.contain,
                        height: Get.width * 0.23,
                        width: Get.width * 0.23,
                      ),
                      model.isFavourite??false?Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset(AppImages.starFill,height: Get.height*0.03,width: Get.width*0.05,)):SizedBox(),
                    ],

                  ),
                ),
              ],
            ),
          ),
          title: Row(
            children: [
              Text(
                model.name,
                style: AppTextStyle.montserrat(
                    AppColors.shadedBlack, Get.width * 0.04, FontWeight.w400),
              ),
              const Spacer(),
              Text(
                model.time,
                style: AppTextStyle.montserrat(
                    AppColors.lightGrey, Get.width * 0.03, FontWeight.w400),
              ),
            ],
          ),
          minLeadingWidth: Get.width*0.25,
          horizontalTitleGap: 0,
          subtitle: Container(
              margin: EdgeInsets.symmetric(vertical: Get.width * 0.01),
              child: Text(
                  model.lastMessage,
                  style: AppTextStyle.montserrat(
                      AppColors.greyDark, Get.width * 0.035, FontWeight.w400),maxLines: 2,overflow: TextOverflow.ellipsis
              )),
          onTap: () {
            model.seen=true;
            provider.update();
            setState(() {

            });
            Get.to(() => ChatDetails(name: model.name));
          },
        ),
      );


    },);
  }
}
