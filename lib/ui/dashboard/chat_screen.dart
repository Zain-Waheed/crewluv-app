import 'package:amigos/helpers/bottom_sheets/congratulation_bottomsheet.dart';
import 'package:amigos/helpers/widgets/crew_members_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/group_chat_model.dart';
import 'package:amigos/models/personal_chat_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/chat_details.dart';
import 'package:amigos/ui/dashboard/dashboard.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


int chatIndex = 0;
PageController chatController = PageController();
class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: Get.width * 0.05,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: Get.width * 0.09,
                width: Get.width * 0.5,
                margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.genderBorder),
                    color: AppColors.offWhite),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          chatIndex = 0;
                          chatController.jumpToPage(chatIndex);
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: chatIndex == 0
                                ? AppColors.themeColor
                                : AppColors.offWhite,
                          ),
                          child: Center(
                              child: Text(
                            getTranslated(context, "chats") ?? "",
                            style: AppTextStyle.montserrat(
                                chatIndex == 0
                                    ? AppColors.whiteColor
                                    : AppColors.shadedBlack,
                                Get.width * 0.035,
                                FontWeight.w400),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          chatIndex = 1;
                          chatController.jumpToPage(chatIndex);
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: chatIndex == 1
                                ? AppColors.themeColor
                                : AppColors.offWhite,
                          ),
                          child: Center(
                              child: Text(
                            getTranslated(context, 'my_crew') ?? "",
                            style: AppTextStyle.montserrat(
                                chatIndex == 1
                                    ? AppColors.whiteColor
                                    : AppColors.shadedBlack,
                                Get.width * 0.035,
                                FontWeight.w400),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: chatController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: List.generate(provider.personalChats.length,
                        (index) => personalChatItemWidget(provider.personalChats[index])),
                  ),
                  Column(
                    children: List.generate(
                        provider.groupChats.length,
                        (index) =>
                            groupChatItemWidget(provider.groupChats[index])),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget personalChatItemWidget(PersonalChatModel model) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(
          model.imagePath,
          scale: 0.5,
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
        subtitle: Container(
            margin: EdgeInsets.symmetric(vertical: Get.width * 0.01),
            child: Text(
              model.lastMessage,
              style: AppTextStyle.montserrat(
                  AppColors.greyDark, Get.width * 0.035, FontWeight.w400),maxLines: 2,overflow: TextOverflow.ellipsis
            )),
        onTap: () {
          Get.to(() => Chat(name: model.name));
        },
      ),
    );
  }
  Widget groupChatItemWidget(GroupChatModel model,) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Stack(
          children: [
            CrewMembersWidget(margin: 0, image: AppImages.crew1),
            CrewMembersWidget(margin: 10, image: AppImages.crew2),
            Container(
                margin: EdgeInsets.only(left: 30, top: 7.5),
                decoration: BoxDecoration(
                    color: AppColors.grey,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.whiteColor)),
                height: 35,
                width: 35,
                child: Center(
                  child: Text(
                    "+9",
                    style: AppTextStyle.montserrat(
                        AppColors.whiteColor,
                        Get.width * 0.04,
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
          Get.to(() => Chat(name: model.chatName));
        },
      ),
    );
  }

}
