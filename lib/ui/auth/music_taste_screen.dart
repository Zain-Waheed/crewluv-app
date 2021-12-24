import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/app_button_small.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/auth/interests.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MusicTaste extends StatefulWidget {
  const MusicTaste({Key? key}) : super(key: key);

  @override
  _MusicTasteState createState() => _MusicTasteState();
}

class _MusicTasteState extends State<MusicTaste> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context,provider,_){
      return Scaffold(
          // appBar: PreferredSize(
          //   preferredSize: Size.fromHeight(Get.width * 0.17),
          //   child:CustomAppBar(function: () {
          //     Get.back();
          //   }, backButton: true,title: 'complete_profile',),
          // ),
          // backgroundColor: AppColors.whiteBackground,
          // bottomNavigationBar: Container(
          //   height: Get.width*0.3,
          //   margin: EdgeInsets.symmetric(horizontal: Get.width*0.07),
          //   child: Column(
          //     children: [
          //       SizedBox(
          //         height: Get.width*0.04,
          //       ),
          //       AppButton(buttonText: 'further', onpressed: (){
          //         Get.to(Intersets());
          //       }, width:Get.width, isWhite: false),
          //       SizedBox(
          //         height: Get.width*0.01,
          //       ),
          //       TextButton(
          //         onPressed: (){},
          //         child: Text(getTranslated(context, 'skip_this_step')??"",
          //           style: AppTextStyle.poppins(AppColors.orangeDark, Get.width*0.04,FontWeight.w500),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          body:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.width*0.1,
              ),
              Text(getTranslated(context, 'music_taste')??"",
                style: AppTextStyle.montserrat(AppColors.black, Get.width*0.06, FontWeight.w600),
              ),
              SizedBox(
                height: Get.width*0.06,
              ),
              Text(getTranslated(context, 'share_your_music')??"",
                style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w400),
              ),
              SizedBox(
                height: Get.width*0.08,
              ),
              SingleChildScrollView(
                child: Wrap(
                  children:
                  List.generate(
                      provider.musictaste.length,
                          (index) => AppButtonSmall(preference: provider.musictaste[index])
                  )
                  ,
                ),
              ),
            ],
          )
      );
    });
  }
}