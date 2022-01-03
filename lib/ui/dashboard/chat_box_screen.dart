import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({Key? key}) : super(key: key);

  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  List<String> sendInvite=[
    "Tessa",
    "John",
    "Jack",
    "Tessa",
    "John",
    "Jack",
    "Tessa",
    "John",
    "Jack",
    "Tessa",
    "John",
    "Jack",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.width * 0.17),
        child: AppBar(
          leading: Container(
            margin:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(0.5),
                      offset: Offset(0, 4),
                      blurRadius: 5.0)
                ]),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.black,
              ),
            ),
          ),
          title: Row(
            children: [
              SizedBox(
                width: Get.width * 0.08,
              ),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: AppColors.blue, width: Get.height * 0.002),
                ),
                child: const CircleAvatar(
                  radius: 10,
                  backgroundImage: CachedNetworkImageProvider(
                    'https://e8rbh6por3n.exactdn.com/sites/uploads/2020/05/villa-la-gi-thumbnail.jpg?strip=all&lossy=1&ssl=1',
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * 0.03,
              ),
              Text(
                'American Party',
                style: AppTextStyle.montserrat(
                    AppColors.black, Get.width * 0.05, FontWeight.bold),
              ),
            ],
          ),
          centerTitle: true,
          leadingWidth: Get.width * 0.2,
          toolbarHeight: Get.width * 0.3,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.width*0.04,
              ),
              Text(
                "Admin",
                style: AppTextStyle.montserrat(
                  AppColors.shadedBlack,
                  Get.width*0.05,
                  FontWeight.w500,
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.width * 0.01),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.themeColor, width: Get.height * 0.002),
                    ),
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundImage: CachedNetworkImageProvider(
                        'https://e8rbh6por3n.exactdn.com/sites/uploads/2020/05/villa-la-gi-thumbnail.jpg?strip=all&lossy=1&ssl=1',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.03,
                  ),
                  Text(
                    'Justin',
                    style: AppTextStyle.montserrat(
                      AppColors.shadedBlack,
                      Get.width * 0.05,
                      FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: (){},
                    icon: Image.asset(AppImages.chat2,color: AppColors.themeColor,),
                  )
                ],
              ),
            ),
              Text(
                "Members",
                style: AppTextStyle.montserrat(
                  AppColors.shadedBlack,
                  Get.width*0.05,
                  FontWeight.w500,
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children:
                  List.generate(sendInvite.length,
                          (index) => crewInviteWidget(sendInvite[index])
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  crewInviteWidget(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.width * 0.01),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: AppColors.themeColor, width: Get.height * 0.002),
            ),
            child: const CircleAvatar(
              radius: 15,
              backgroundImage: CachedNetworkImageProvider(
                'https://e8rbh6por3n.exactdn.com/sites/uploads/2020/05/villa-la-gi-thumbnail.jpg?strip=all&lossy=1&ssl=1',
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.03,
          ),
          Text(
            title,
            style: AppTextStyle.montserrat(
              AppColors.shadedBlack,
              Get.width * 0.05,
              FontWeight.w500,
            ),
          ),
          Spacer(),
          IconButton(
              onPressed: (){},
              icon: Image.asset(AppImages.chat2,color: AppColors.themeColor,),
          )
        ],
      ),
    );
  }
}
