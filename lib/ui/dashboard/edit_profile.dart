import 'dart:io';

import 'package:amigos/helpers/bottom_sheets/edit_gender_bottomsheet.dart';
import 'package:amigos/helpers/bottom_sheets/edit_interests.dart';
import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/app_button_small.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/PreferenceModel.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/dashboard.dart';
import 'package:amigos/ui/dashboard/profile_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
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
      return GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Get.width * 0.17),
            child: CustomAppBar(
              function: () {
                Get.back();
              },
              backButton: true,
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
                    height: Get.width * 0.1,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical:15 ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.dotColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTranslated(context, 'media') ?? "",
                            style: AppTextStyle.montserrat(
                              AppColors.shadedBlack,
                              Get.width * 0.04,
                              FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.width * 0.02,
                          ),
                          Text(
                            getTranslated(context, 'who_you_are') ?? "",
                            style: AppTextStyle.montserrat(
                                AppColors.greyText, Get.width * 0.035, FontWeight.w400),
                          ),
                          SizedBox(height: 5,),
                          SizedBox(
                            width: Get.width,
                            height: Get.height * 0.42,
                            child: GridView.builder(
                                gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 120,
                                  childAspectRatio: 1.3 / 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: provider.mediaListImages.length,
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
                        ],
                      )

                  ),
                  SizedBox(
                    height: Get.width * 0.05,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical:15 ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.dotColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getTranslated(context, 'about') ?? "",
                          style: AppTextStyle.montserrat(
                            AppColors.shadedBlack,
                            Get.width * 0.04,
                            FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(getTranslated(context, "write_something_funny")??'',style: AppTextStyle.montserrat(AppColors.greyText, Get.width*0.035, FontWeight.w400),),
                        SizedBox(height: 10,),
                        TextFormField(
                            maxLines: 3,
                            decoration: AppInputDecoration.lessCircularDecoration(
                              null,
                              'write_here',
                              null,
                              AppColors.offWhite,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.width * 0.05,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical:15 ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.dotColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.bottomSheet(EditInterests());
                          },
                          child: Text(
                            getTranslated(context, 'interests') ?? "",
                            style: AppTextStyle.montserrat(
                              AppColors.shadedBlack,
                              Get.width * 0.04,
                              FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          getTranslated(context, 'what_you_like') ?? "",
                          style: AppTextStyle.montserrat(
                            AppColors.greyText,
                            Get.width * 0.035,
                            FontWeight.w400,
                          ),
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
                      ],
                    )

                  ),
                  SizedBox(
                    height: Get.width * 0.02,
                  ),
                  SizedBox(
                    height: Get.width * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Get.width*0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        TextFormField(
                          decoration: AppInputDecoration.circularFieldDecoration(
                            null,
                            'female',
                            null,
                          ),
                          readOnly: true,
                          onTap: (){
                            Get.bottomSheet(const EditGender());
                          },
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
                            onpressed: () {
                              Get.back();

                            },
                            width: Get.width * 1,
                            isWhite: false),
                        SizedBox(
                          height: Get.width * 0.05,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
