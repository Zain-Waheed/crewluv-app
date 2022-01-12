import 'package:amigos/helpers/bottom_sheets/congratulation_bottomsheet.dart';
import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/main.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/auth/enter_dob.dart';
import 'package:amigos/ui/auth/favorite_drinks_screen.dart';
import 'package:amigos/ui/auth/fullname_screen.dart';
import 'package:amigos/ui/auth/interests.dart';
import 'package:amigos/ui/auth/login_screen.dart';
import 'package:amigos/ui/auth/media_profile_screen.dart';
import 'package:amigos/ui/auth/music_taste_screen.dart';
import 'package:amigos/ui/auth/select_gender.dart';
import 'package:amigos/ui/auth/university_screen.dart';
import 'package:amigos/ui/dashboard/dashboard.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:amigos/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

FocusNode focus = FocusNode();

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _controller = PageController();
  int percentage = 10;
  double percent = 0.1;
  bool isChecked = false;
  bool isGrey = true;
  bool isFocused = false;
  //var model = Provider.<DashboardProvider>of(context , listen: false);

  Future<bool> _willPopCallback() async {
    var model = Provider.of<DashboardProvider>(context, listen: false);
    if (model.pageIndex > 0) {
      model.pageIndex--;
      percentageValue(model);
      _controller.jumpToPage(model.pageIndex);
    } else {
      model.pageIndex = 0;
      percentageValue(model);
      Get.to(const Login());
    }
    setState(() {});
    return Future.value(false);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, dashPro, _) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Get.width * 0.17),
            child: CustomAppBar(
                function: () {
                  //Get.to(() => const PhoneNumber());
                  if (dashPro.pageIndex > 0) {
                    dashPro.pageIndex--;
                    percentageValue(dashPro);
                    _controller.jumpToPage(dashPro.pageIndex);
                  } else {
                    dashPro.pageIndex = 0;
                    percentageValue(dashPro);
                    Get.to(const Login());
                  }
                },
                backButton: dashPro.pageIndex == 0 ? false : true,
                title: 'complete_profile'),
          ),
          bottomNavigationBar: Container(
            height: dashPro.pageIndex == 5 ||
                    dashPro.pageIndex == 6 ||
                    dashPro.pageIndex == 7 ||
                    dashPro.pageIndex == 3 ||
                    dashPro.pageIndex==0
                ? Get.width * 0.3
                : Get.width * 0.2,
            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
            child: Column(
              children: [
                SizedBox(
                  height: Get.width * 0.04,
                ),
                dashPro.formCheck[dashPro.pageIndex] == 1
                    ? AppButton(
                        isWhite: false,
                        width: Get.width * 0.9,
                        buttonText: dashPro.pageIndex == 8 ? 'done' : 'further',
                        onpressed: () {
                          if (dashPro.formKey.currentState!.validate() &&
                              isChecked == true) {
                            if (dashPro.pageIndex <= 8) {
                              dashPro.pageIndex++;
                              if (dashPro.pageIndex != 9) {
                                _controller.jumpToPage(dashPro.pageIndex);
                              } else {
                                Get.bottomSheet(const CongraulationBottomSheet(
                                  text: 'your_profile_has_been_completed',
                                ));
                                Future.delayed(const Duration(seconds: 2),(){
                                  Get.to(const DashBoardScreen());
                                });
                              }
                              percentageValue(dashPro);
                            }
                          }
                        },
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(const Size(400, 50)),
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.solidGrey),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: null,
                        child: Text(
                          getTranslated(context, 'further') ?? "",
                          style: AppTextStyle.montserrat(AppColors.whiteColor,
                              Get.width * 0.04, FontWeight.w600),
                        ),
                      ),
                Visibility(
                  visible: dashPro.pageIndex == 5 ||
                          dashPro.pageIndex == 3 ||
                          dashPro.pageIndex == 6 ||
                          dashPro.pageIndex == 7
                      ? true
                      : false,
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          if (isChecked == true) {
                            if (dashPro.pageIndex <= 8) {
                              dashPro.pageIndex++;
                              print("dash check");
                              if (dashPro.pageIndex != 9) {
                                print("check");
                                _controller.jumpToPage(dashPro.pageIndex);
                              } else {
                                Get.bottomSheet(const CongraulationBottomSheet(
                                  text: 'your_profile_has_been_completed',
                                ));
                                Future.delayed(Duration(seconds: 3),(){
                                  Get.to(
                                      DashBoardScreen()
                                  );
                                });
                              }
                              percentageValue(dashPro);
                            }
                          }

                        },
                        child: Text(
                          getTranslated(context, 'skip') ?? "",
                          style: AppTextStyle.poppins(AppColors.blackLite,
                              Get.width * 0.04, FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.width * 0.1,
                ),
                Row(
                  children: [
                    Expanded(
                      child: LinearPercentIndicator(
                        percent: percent,
                        lineHeight: Get.width * 0.04,
                        linearGradient: AppColors.buttonGradientColor,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.01,
                    ),
                    Text(
                      percentage.toString() + '%',
                      style: AppTextStyle.montserrat(AppColors.lightGrey,
                          Get.width * 0.04, FontWeight.w300),
                    )
                  ],
                ),
                Form(
                  key: dashPro.formKey,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _controller,
                      onPageChanged: (index) {
                        setState(() {
                          dashPro.pageIndex = index;
                        });
                      },
                      children: [
                        emailScreen(dashPro),
                        const EnterFullName(),
                        const EnterDOB(),
                        const University(),
                        const SelectGender(),
                        const FavoriteDrinks(),
                        const MusicTaste(),
                        const Intersets(),
                        const MediaProfile(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget emailScreen(DashboardProvider dashPro) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.width * 0.1,
          ),
          Text(
            getTranslated(context, 'enter_email_address') ?? "",
            style: AppTextStyle.montserrat(
                AppColors.shadedBlack, Get.width * 0.06, FontWeight.w600),
          ),
          SizedBox(
            height: Get.width * 0.05,
          ),
          Text(
            getTranslated(context, 'confirm_email') ?? "",
            style: AppTextStyle.montserrat(
                AppColors.lightGrey, Get.width * 0.035, FontWeight.w400),
          ),
          SizedBox(height: Get.width * 0.15),
          Theme(
            data: ThemeData().copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                    primary: createMaterialColor(AppColors.themeColor))),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: dashPro.emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: focus,
              onChanged: (val) {
                setState(() {

                });
              },
              validator: (value) =>
                  FieldValidator.validateEmail(dashPro.emailController.text),
              decoration: AppInputDecoration.circularFieldDecoration(
                null,
                'enter_email',
                Image.asset(
                  AppImages.emailIcon,
                  color:
                      focus.hasFocus ? AppColors.themeColor : AppColors.slateGrey,
                ),
              ),
            ),
          ),
          SizedBox(height: Get.width * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: isChecked,
                activeColor: AppColors.themeColor,
                onChanged: (value) {
                  if(value==true ){
                    dashPro.formCheck[dashPro.pageIndex] = 1;
                    setState(() {

                    });
                  }else
                    {
                      dashPro.formCheck[dashPro.pageIndex] = -1;
                    }
                  isChecked = value!;
                  setState(() {});
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Expanded(
                  child: Text(
                getTranslated(context, "like_to_update") ?? "",
                style: AppTextStyle.montserrat(
                    AppColors.lightGrey, Get.width * 0.027, FontWeight.w400),
              )),
            ],
          )
        ],
      ),
    );
  }

  void percentageValue(DashboardProvider dashPro) {
    if (dashPro.pageIndex == 0) {
      setState(() {
        percentage = 10;
        percent = 0.1;
      });
    } else if (dashPro.pageIndex == 1) {
      setState(() {
        percentage = 20;
        percent = 0.2;
      });
    } else if (dashPro.pageIndex == 2) {
      setState(() {
        percentage = 30;
        percent = 0.30;
      });
    } else if (dashPro.pageIndex == 3) {
      setState(() {
        percentage = 40;
        percent = 0.4;
      });
    } else if (dashPro.pageIndex == 4) {
      setState(() {
        percentage = 50;
        percent = 0.5;
      });
    } else if (dashPro.pageIndex == 5) {
      setState(() {
        percentage = 60;
        percent = 0.60;
      });
    } else if (dashPro.pageIndex == 6) {
      setState(() {
        percentage = 70;
        percent = 0.70;
      });
    } else if (dashPro.pageIndex == 7) {
      setState(() {
        percentage = 80;
        percent = 0.80;
      });
    } else if (dashPro.pageIndex == 8) {
      setState(() {
        percentage = 90;
        percent = 0.9;
      });
    }
  }
}
