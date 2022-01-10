import 'package:amigos/helpers/widgets/app_button_small.dart';
import 'package:amigos/helpers/widgets/notification_dialog.dart';
import 'package:amigos/helpers/widgets/prefrence_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/user_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/chat_details.dart';
import 'package:amigos/ui/dashboard/profiles_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


class ProfileDetail extends StatefulWidget {
 final  UserModel user;
  const ProfileDetail({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
 bool isStar=false;
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
        builder: (context, provider, _)
    {
      return Scaffold(
        floatingActionButton: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding:  EdgeInsets.only(left: Get.width*0.06,top:Get.width*0.12),
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.black.withOpacity(0.5),
                          offset: Offset(0, 4),
                          blurRadius: 5.0)
                    ]
                ),
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
              onPressed: () {  },
            ),
          ),
        ),
          body: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height * .55,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(
                      top: Get.width * 0.099, left: Get.width * 0.06,),
                    decoration: BoxDecoration(
                      gradient:AppColors.blackGradien,
                      image: DecorationImage(
                        image: AssetImage(AppImages.userImage,),
                        fit: BoxFit.cover,
                      ),
                    )
                  ),
                  Container(
                    width: Get.width,
                    height: Get.height * .55,
                    padding: EdgeInsets.only(
                      top: Get.width * 0.099, left: Get.width * 0.06,),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      gradient: AppColors.blackGradien,
                    ),
                  ),
                ]
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width,
                  height: Get.height * .5,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height*0.04,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(widget.user.imagePath??"",scale: 4,),
                            SizedBox(width: Get.width*0.02,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      widget.user.name ?? "",
                                      style: AppTextStyle.montserrat(
                                          AppColors.black3d, Get.width * 0.04, FontWeight.w500),
                                    ),
                                    const Text(','),
                                    Text(
                                      widget.user.age.toString(),
                                      style: AppTextStyle.montserrat(
                                          AppColors.black3d, Get.width * 0.04, FontWeight.w500),
                                    ),
                                    SizedBox(width: Get.width*0.04,),
                                    provider.users[0].isVerified
                                        ? Image.asset(AppImages.verified,scale: 3,)
                                        : SizedBox(),
                                  ],
                                ),
                                SizedBox(height: Get.width*0.01,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: Get.width*0.028,
                                      width: Get.width*0.028,
                                      decoration:  BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.greenActive,
                                      ),
                                    ),
                                    SizedBox(width: Get.width*0.02,),
                                    Text(widget.user.activeStatus, style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width * 0.04, FontWeight.w500),),
                                  ],
                                ),
                                SizedBox(height: Get.width*0.02,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(AppImages.locationEvent,scale: 3,),
                                    SizedBox(width: Get.width*0.01,),
                                    Text(widget.user.distance.toString(),style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width * 0.04, FontWeight.w500),),
                                    Text(getTranslated(context,"miles_away",)??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width * 0.04, FontWeight.w500),),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Image.asset(AppImages.bonFire,scale: 1.5,),
                          ],
                        ),
                        SizedBox(
                          height: Get.height*0.01,
                        ),
                        Text(getTranslated(context, 'interests') ?? "",
                          style: AppTextStyle.montserrat(
                              AppColors.shadedBlack, Get.width * 0.04,
                              FontWeight.w500),),
                        SizedBox(
                          height: Get.height*0.01,
                        ),
                        Row(
                          children:
                          List.generate(
                              widget.user.intrests!.where((element) => element.isSelected==true).length,

                                  (index) {
                                List userlist=widget.user.intrests!.where((element) => element.isSelected==true).toList();
                                return PrefrenceWidget(preference:userlist[index], largeSize:true,);
                              }),
                        ),
                        SizedBox(
                          height: Get.height*0.02,
                        ),
                        Text(getTranslated(context, 'my_music') ?? "",
                          style: AppTextStyle.montserrat(
                              AppColors.shadedBlack, Get.width * 0.04,
                              FontWeight.w500),),
                        SizedBox(
                          height: Get.height*0.01,
                        ),
                        Row(
                          children:
                          List.generate(
                              widget.user.music!.where((element) => element.isSelected==true).length,

                                  (index) {
                                List userlist=widget.user.music!.where((element) => element.isSelected==true).toList();
                                return PrefrenceWidget(preference:userlist[index] ,largeSize:true,);
                              }),
                        ),
                        SizedBox(
                          height: Get.height*0.04,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap:(){
                                Get.to(ChatDetails(name: widget.user.name??""));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: Get.width*0.04,top: Get.height*0.03),
                                width:Get.width*0.14,
                                height:Get.width*0.14,
                                alignment: Alignment.center,
                                padding:  const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.black.withOpacity(0.5),
                                          offset: Offset(0, 4),
                                          blurRadius: 5.0)
                                    ],
                                ),
                                child: Image.asset(AppImages.chat),
                              ),
                            ),
                            GestureDetector(
                              onTap:(){
                                Get.to(Profiles());
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: Get.width*0.04),
                                width:Get.width*0.16,
                                height:Get.width*0.16,
                                alignment: Alignment.center,
                                padding:  const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.black.withOpacity(0.5),
                                        offset: Offset(0, 4),
                                        blurRadius: 5.0)
                                  ],
                                ),
                                child: Image.asset(AppImages.close),
                              ),
                            ),
                            GestureDetector(
                              onTap:(){
                                Get.dialog(
                                    NotificationDialogBox()
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: Get.width*0.04),
                                width:Get.width*0.16,
                                height:Get.width*0.16,
                                alignment: Alignment.center,
                                padding:  const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.black.withOpacity(0.5),
                                        offset: Offset(0, 4),
                                        blurRadius: 5.0)
                                  ],
                                ),
                                child: Image.asset(AppImages.heart),
                              ),
                            ),
                            GestureDetector(
                              onTap:(){
                                isStar=!isStar;
                                setState(() {

                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: Get.width*0.04,top: Get.height*0.04),
                                width:Get.width*0.14,
                                height:Get.width*0.14,
                                alignment: Alignment.center,
                                padding:  const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.black.withOpacity(0.5),
                                        offset: const Offset(0, 4),
                                        blurRadius: 5.0)
                                  ],
                                ),
                                child: Image.asset(isStar?AppImages.starFill:AppImages.starBlank),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height*0.01,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
      );
    },);
  }
}
