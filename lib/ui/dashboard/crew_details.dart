import 'package:amigos/localization/app_localization.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CrewDetails extends StatefulWidget {
  final  String name;
  const CrewDetails({Key? key, required this.name}) : super(key: key);

  @override
  _CrewDetailsState createState() => _CrewDetailsState();
}

class _CrewDetailsState extends State<CrewDetails> {
  List<String> sendInvite=[
    "Tessa",
    "John",
    "Jack",
    "Tessa",
    "John",
    "Jack",
    "Tessa",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.width * 0.17),
        child: PreferredSize(
          preferredSize: Size.fromHeight(Get.width * 0.17),
          child: AppBar(
            leading: Container(
              margin:  EdgeInsets.symmetric(vertical: Get.width*0.042, horizontal:Get.width*0.055),
              padding: EdgeInsets.only(left:7),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.black.withOpacity(0.5),
                        offset: Offset(0, 1),
                        blurRadius: 2)
                  ]
              ),
              child: IconButton(
                onPressed:(){
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.black,
                  size: Get.width*0.04,
                ),
              ),
            ),
            title: GestureDetector(
              onTap:(){

              },
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.08,
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.maroon, width: Get.height * 0.002),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                              AppImages.crew2
                          ),
                          radius: 12,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left:10),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                              AppImages.crew2
                          ),
                          radius: 14,
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 20,),
                          decoration: BoxDecoration(
                            color: AppColors.greyText,
                            shape: BoxShape.circle,
                          ),
                          height: 30,
                          width: 30,
                          child: Center(
                            child: Text(
                              "+9",
                              style: AppTextStyle.montserrat(
                                  AppColors.whiteColor,
                                  Get.width * 0.02,
                                  FontWeight.w500),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Text(
                    widget.name,
                    style: AppTextStyle.montserrat(
                        AppColors.black, Get.width * 0.05, FontWeight.bold),
                  ),
                ],
              ),
            ),
            leadingWidth: Get.width * 0.2,
            toolbarHeight: Get.width * 0.3,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
          ),
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
                  Get.width*0.04,
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
                    child:  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                          AppImages.crew2
                      ),
                      radius: 14,
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
                  Get.width*0.04,
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
    return Slidable(
      enabled: true,
        endActionPane:  ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          children: [
            GestureDetector(
              onTap: (){},
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
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Get.width * 0.01),
        child: Row(
          children: [
            IconButton(
              onPressed: () {  },
              icon: Container(
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
      ),
    );
  }
}
