import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/sample_dashboard.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CrewDetails extends StatefulWidget {
  final  String name;
  const CrewDetails({Key? key, required this.name}) : super(key: key);

  @override
  _CrewDetailsState createState() => _CrewDetailsState();
}

class _CrewDetailsState extends State<CrewDetails> with SingleTickerProviderStateMixin {
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
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
    Consumer<DashboardProvider>(builder: (context,dashPro,_){
      return Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: Get.height*0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: Get.height*0.045,
                    width: Get.width*0.1,
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    // padding: EdgeInsets.only(top: 4,right: 4,bottom: 4),
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
                      onPressed: () {
                        Get.back();
                      },
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.black,
                          size: Get.width*0.045,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.15,
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
                ],
              ),
            ),
            Padding(
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
                            icon: Image.asset(AppImages.chat2,color: AppColors.themeColor,height: Get.height*0.04,width:Get.width*0.05),
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
                      child: SlidableAutoCloseBehavior(
                        child: Column(
                          children:
                          List.generate(dashPro.crews.length,
                                  (index) => crewInviteWidget(dashPro,index)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
  crewInviteWidget(DashboardProvider dashPro,int index) {
    return Slidable(
      key:  ValueKey(index),
      groupTag: "0",
      enabled: true,
        endActionPane:  ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),

          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  dashPro.crews.removeAt(index);
                });
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
              dashPro.crews[index].name,
              style: AppTextStyle.montserrat(
                AppColors.shadedBlack,
                Get.width * 0.05,
                FontWeight.w500,
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: (){},
                icon: Image.asset(AppImages.chat2,color: AppColors.themeColor,height: Get.height*0.04,width:Get.width*0.05),
            )
          ],
        ),
      ),
    );
  }
}
