import 'dart:io';

import 'package:amigos/helpers/bottom_sheets/edit_gender_bottomsheet.dart';
import 'package:amigos/helpers/bottom_sheets/edit_interests.dart';
import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/app_button_small.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/PreferenceModel.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Get.width * 0.17),
          child: CustomAppBar(
            function: () {
              Get.back();
            },
            backButton: false,
            title: 'edit_profile',
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.width * 0.05,
                ),
                Text(
                  getTranslated(context, 'media') ?? "",
                  style: AppTextStyle.montserrat(
                    AppColors.shadedBlack,
                    Get.width * 0.04,
                    FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  height: Get.height * 0.42,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 150,
                        childAspectRatio: 1.3 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: provider.mediaListImages.where((element) =>element.path!="").length+1,
                      itemBuilder: (BuildContext context, int index) {
                        return Visibility(
                          child: SizedBox(
                            width: Get.width * 0.3,
                            height: Get.width * 0.42,
                            child: Stack(children: [
                              GestureDetector(
                                onTap: () {
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
                                    child: provider
                                                .mediaListImages[index].path ==
                                            ""
                                        ? Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              padding: const EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  gradient: AppColors
                                                      .percantageBarGradientColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                              child: Icon(
                                                Icons.add,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            child: Image.file(
                                              provider.mediaListImages[index],
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible:
                                    provider.mediaListImages[index].path == ""
                                        ? false
                                        : true,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        provider.mediaListImages[index] =
                                            File("");
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          gradient: AppColors
                                              .percantageBarGradientColor,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Icon(
                                        Icons.close,
                                        color: AppColors.white,
                                        size: Get.width * 0.04,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.width * 0.04),
                  child: Text(
                    getTranslated(context, 'about') ?? "",
                    style: AppTextStyle.montserrat(
                      AppColors.shadedBlack,
                      Get.width * 0.04,
                      FontWeight.w500,
                    ),
                  ),
                ),
                TextFormField(
                    maxLines: 3,
                    decoration: AppInputDecoration.lessCircularDecoration(
                      null,
                      'describe_what_you',
                      null,
                      AppColors.offWhite,
                    )),
                SizedBox(
                  height: Get.width * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      getTranslated(context, 'interests') ?? "",
                      style: AppTextStyle.montserrat(
                        AppColors.shadedBlack,
                        Get.width * 0.04,
                        FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          Get.bottomSheet(EditInterests());
                        },
                        child: Image.asset(
                          AppImages.draw,
                          scale: 4,
                        )),
                  ],
                ),
                Container(
                  width: Get.width,
                  child: Wrap(
                    children: List.generate(
                        provider.interests
                            .where((element) => element.isSelected == true)
                            .length, (index) {
                      List<PreferenceModel> filterList = provider.interests
                          .where((element) => element.isSelected == true)
                          .toList();
                      return AppButtonSmall(preference: filterList[index]);
                    }),
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.04,
                ),
                Text(
                  getTranslated(context, 'university') ?? "",
                  style: AppTextStyle.montserrat(
                    AppColors.shadedBlack,
                    Get.width * 0.04,
                    FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.05,
                ),
                TextFormField(
                    decoration: AppInputDecoration.circularFieldDecoration(
                  null,
                  'the_university_of_lahore',
                  null,
                )),
                SizedBox(
                  height: Get.width * 0.05,
                ),
                Text(
                  getTranslated(context, 'city') ?? "",
                  style: AppTextStyle.montserrat(
                    AppColors.shadedBlack,
                    Get.width * 0.04,
                    FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.02,
                ),
                TextFormField(
                    decoration: AppInputDecoration.circularFieldDecoration(
                  null,
                  'lahore',
                  null,
                )),
                SizedBox(
                  height: Get.width * 0.05,
                ),
                Text(
                  getTranslated(context, 'gender') ?? "",
                  style: AppTextStyle.montserrat(
                    AppColors.shadedBlack,
                    Get.width * 0.04,
                    FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(const EditGender());
                  },
                  child: IgnorePointer(
                    child: TextFormField(
                      decoration: AppInputDecoration.circularFieldDecoration(
                        null,
                        'female',
                        null,
                      ),
                      readOnly: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.05,
                ),
                Text(
                  getTranslated(context, 'social_media') ?? "",
                  style: AppTextStyle.montserrat(
                    AppColors.shadedBlack,
                    Get.width * 0.04,
                    FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.02,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(350, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.offWhite),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: Get.width * 0.04,
                      bottom: Get.width * 0.04,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImages.instagram,
                          scale: 4,
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        Text(
                          getTranslated(context, 'connect_instagram') ?? "",
                          style: AppTextStyle.montserrat(AppColors.blackLite,
                              Get.width * 0.04, FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.05,
                ),
                AppButton(
                    buttonText: 'save_changes',
                    onpressed: () {},
                    width: Get.width * 1,
                    isWhite: false),
                SizedBox(
                  height: Get.width * 0.05,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
