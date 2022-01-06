import 'dart:io';
import 'package:amigos/helpers/bottom_sheets/congratulation_bottomsheet.dart';
import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MediaProfile extends StatefulWidget {
  const MediaProfile({Key? key}) : super(key: key);

  @override
  _MediaProfileState createState() => _MediaProfileState();
}

class _MediaProfileState extends State<MediaProfile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, _) {
      return Scaffold(
          // appBar: PreferredSize(
          //   preferredSize: Size.fromHeight(Get.width * 0.17),
          //   child: CustomAppBar(
          //     function: () {
          //       Get.back();
          //     },
          //     backButton: true,
          //     title: 'complete_profile',
          //   ),
          // ),
          // backgroundColor: AppColors.whiteBackground,
          // bottomNavigationBar: Container(
          //   height: Get.width * 0.3,
          //   margin: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
          //   child: Column(
          //     children: [
          //       SizedBox(
          //         height: Get.width * 0.04,
          //       ),
          //       AppButton(
          //           buttonText: 'further',
          //           onpressed: () {
          //             Get.bottomSheet(
          //               CongraulationBottomSheet(),isScrollControlled: true,
          //             );
          //           },
          //           width: Get.width,
          //           isWhite: false),
          //       SizedBox(
          //         height: Get.width * 0.01,
          //       ),
          //       TextButton(
          //         onPressed: () {},
          //         child: Text(
          //           getTranslated(context, 'skip_this_step') ?? "",
          //           style: AppTextStyle.poppins(AppColors.orangeDark,
          //               Get.width * 0.04, FontWeight.w500),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.width * 0.1,
              ),
              Text(
                getTranslated(context, 'media') ?? "",
                style: AppTextStyle.montserrat(
                    AppColors.black, Get.width * 0.06, FontWeight.w600),
              ),
              SizedBox(
                height: Get.width * 0.06,
              ),
              Text(
                getTranslated(context, 'share_some_pictures') ?? "",
                style: AppTextStyle.montserrat(
                    AppColors.black, Get.width * 0.04, FontWeight.w400),
              ),
              SizedBox(
                height: Get.width * 0.08,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      childAspectRatio: 1.3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing:10,
                    ),
                       itemCount: provider.mediaListImages.where((element) => element.path != "").length +1,
                     itemBuilder: (BuildContext context,int index){
                      return Visibility(
                        child: SizedBox(
                          width: Get.width * 0.3,
                          height: Get.width * 0.42,
                          child: Stack(
                              children:[
                                GestureDetector(
                                  onTap:(){
                                    provider.getProfileImage(index);
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: Get.width * 0.26,
                                      height: Get.width * 0.38,
                                      decoration: BoxDecoration(
                                        color: AppColors.offWhite,
                                        border: Border.all(
                                          color: AppColors.borderShadow,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: provider.mediaListImages[index].path==""?Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                gradient: AppColors.percantageBarGradientColor,
                                                borderRadius: BorderRadius.circular(16)
                                            ),
                                            child: Icon(Icons.add,color: AppColors.white,),
                                          ),):ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                            child: Image.file(provider.mediaListImages[index],
                                        fit: BoxFit.fill,
                                      ),
                                          ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: provider.mediaListImages[index].path==""?false:true,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child:GestureDetector(
                                      onTap:(){
                                        setState(() {
                                          provider.mediaListImages[index]=File("");
                                        });
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              gradient: AppColors.percantageBarGradientColor,
                                              borderRadius: BorderRadius.circular(16)
                                          ),
                                          child: Icon(Icons.close,color: AppColors.white,size: Get.width*0.04,),
                                        ),
                                    ),
                                    ),
                                  ),
                              ]
                          ),
                        ),
                      );
                     }
                ),
              ),
            ],
          ));
    });
  }

}
