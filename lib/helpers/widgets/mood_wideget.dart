import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/mood_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'app_button.dart';
import 'mood_type_widget.dart';

class MoodWidget extends StatefulWidget {
  const MoodWidget({Key? key}) : super(key: key);

  @override
  _MoodWidgetState createState() => _MoodWidgetState();
}

class _MoodWidgetState extends State<MoodWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, _) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          backgroundColor: AppColors.opacBlack,
          body: Center(
              child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16),
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.065, vertical: Get.width * 0.05),
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.02, vertical: Get.width * 0.03),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    getTranslated(context, 'up_for') ?? "",
                    style: AppTextStyle.montserrat(
                        AppColors.black, Get.width * 0.05, FontWeight.w700),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text(
                    getTranslated(context, 'share_updates') ?? "",
                    style: AppTextStyle.montserrat(AppColors.shadedBlack,
                        Get.width * 0.04, FontWeight.w400),
                  ),
                  SizedBox(
                    height: Get.width * 0.03,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(provider.moods.length, (index) {
                        return GestureDetector(
                            onTap: () {
                              for (int i = 0; i < provider.moods.length; i++) {
                                if (provider.moods[i].selected == true) {
                                  provider.moods[i].selected = false;
                                }
                                provider.moods[index].selected = true;
                                setState(() {});
                              }
                            },
                            child: MoodWithPicture(provider.moods[index]));
                      }),
                    ),
                  ),
                  SizedBox(
                    height: Get.width * 0.05,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        getTranslated(context, 'in_mood') ?? "",
                        style: AppTextStyle.montserrat(AppColors.shadedBlack,
                            Get.width * 0.035, FontWeight.w500),
                      )),
                  SizedBox(
                    height: Get.width * 0.01,
                  ),
                  TextFormField(
                    maxLines: 2,
                    decoration: AppInputDecoration.lessCircularDecoration(
                        null, 'type_here', null, AppColors.silverWhite),
                  ),
                  SizedBox(
                    height: Get.width * 0.05,
                  ),
                  AppButton(
                    width: Get.width,
                    isWhite: false,
                    buttonText: 'lets_go',
                    onpressed: () {
                      int moodIndex = provider.moods
                          .indexWhere((element) => element.selected == true);
                      provider.mood = provider.moods[moodIndex].iconImagePath;
                      provider.update();
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      getTranslated(context, 'skip') ?? "",
                      style: AppTextStyle.montserrat(AppColors.blackLite,
                          Get.width * 0.04, FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          )),
        ),
      );
    });
  }

  Widget MoodWithPicture(MoodModel model) {
    return Container(
      height: Get.height * 0.25,
      width: Get.width * 0.40,
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            model.ImagePath,
          ),
          colorFilter: ColorFilter.mode(
              model.selected
                  ? AppColors.blue.withOpacity(0.5)
                  : Colors.transparent,
              BlendMode.darken),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              model.iconImagePath,
              height: Get.width * 0.2,
              width: Get.width * 0.05,
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            Text(
              model.name,
              style: AppTextStyle.montserrat(
                  AppColors.whiteColor, Get.width * 0.04, FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
