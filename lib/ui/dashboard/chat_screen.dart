import 'package:amigos/helpers/bottom_sheets/congratulation_bottomsheet.dart';
import 'package:amigos/helpers/widgets/crew_members_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/chat_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/chat_details.dart';
import 'package:amigos/ui/dashboard/dashboard.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int index = 0;
  PageController controller = PageController();

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
                          index = 0;
                          controller.jumpToPage(index);
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: index == 0
                                ? AppColors.themeColor
                                : AppColors.offWhite,
                          ),
                          child: Center(
                              child: Text(
                            getTranslated(context, "chats") ?? "",
                            style: AppTextStyle.montserrat(
                                index == 0
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
                          index = 1;
                          controller.jumpToPage(index);
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: index == 1
                                ? AppColors.themeColor
                                : AppColors.offWhite,
                          ),
                          child: Center(
                              child: Text(
                            getTranslated(context, 'my_crew') ?? "",
                            style: AppTextStyle.montserrat(
                                index == 1
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
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: List.generate(provider.chats.length,
                        (index) =>
                            Slidable(
                                enabled: true,
                                endActionPane:  ActionPane(
                                  extentRatio: 0.25,
                                  motion: const ScrollMotion(),
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {

                                        });
                                        provider.chats.removeAt(index);
                                      },
                                      child: Container(
                                        width:Get.width*0.1,
                                        height:Get.width*0.1,
                                        margin:EdgeInsets.only(left: Get.width*0.02),
                                        decoration: const BoxDecoration(
                                          color: Colors.orange,
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
                                child: chatItemWidget(provider.chats[index], true)
                            )
                    ),
                  ),
                  Column(
                    children: List.generate(
                        provider.chats.length,
                        (index) =>
                            chatItemWidget(provider.chats[index], false)),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget chatItemWidget(ChatModel model, bool personalChat) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: personalChat?Image.asset(
          model.imagePath,
          scale: 0.5,
        ): Stack(
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
                  AppColors.greyDark, Get.width * 0.035, FontWeight.w400),
            )),
        onTap: () {
          Get.to(() => Chatt(name: model.name));
        },
      ),
    );
  }
}
