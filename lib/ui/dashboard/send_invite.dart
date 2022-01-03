import 'dart:io';

import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendInvite extends StatefulWidget {
  const SendInvite({Key? key}) : super(key: key);

  @override
  _SendInviteState createState() => _SendInviteState();
}

class _SendInviteState extends State<SendInvite> {
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
        preferredSize: Size.fromHeight(Get.width*0.17),
        child: CustomAppBar(
          function: () {Get.back();},
          title: "send_invite",
          backButton: true,
        ),

      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04),
        child: SingleChildScrollView(
          child: Column(
            children:
            List.generate(sendInvite.length,
                    (index) => crewInviteWidget(sendInvite[index])
            ),
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
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: Get.width * 0.03, horizontal: Get.width * 0.05),
              margin: EdgeInsets.only(
                  right: Get.width * 0.025, top: Get.width * 0.03),
              decoration: BoxDecoration(
                color: AppColors.pink,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(0.2),
                      offset: const Offset(0, 4),
                      blurRadius: 5.0)
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(getTranslated(context, 'invite')??"",
                style: AppTextStyle.montserrat(
                    AppColors.orangedark, Get.width * 0.04, FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }
}
