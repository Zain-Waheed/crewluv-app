import 'package:amigos/helpers/bottom_sheets/congratulation_bottomsheet.dart';
import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/helpers/widgets/date_dialog.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/auth/email_screen.dart';
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
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';


class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  FocusNode focus = FocusNode();
  final PageController _controller = PageController();
  int percentage = 10;
  double percent = 0.1;
  bool isGrey = true;
  bool isFocused = false;
  //var model = Provider.<DashboardProvider>of(context , listen: false);

  Future<bool> _willPopCallback() async {
    var model = Provider.of<DashboardProvider>(context, listen: false);
    if (model.pageIndex > 0) {
      model.pageIndex--;
      model.update();
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
          dashPro.setFocus();
        },
        child: WillPopScope(
          onWillPop: _willPopCallback,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(Get.width * 0.17),
              child: CustomAppBar(
                  function: () {
                    //Get.to(() => const PhoneNumber());
                    if (dashPro.pageIndex > 0) {
                      dashPro.pageIndex--;
                      dashPro.update();
                      percentageValue(dashPro);
                      _controller.jumpToPage(dashPro.pageIndex);
                    } else {
                      dashPro.pageIndex = 0;
                       dashPro.emailController.clear();
                       dashPro.dayController.clear();
                      dashPro.monthController.clear();
                      dashPro.yearController.clear();
                       dashPro.fullNameController.clear();
                       dashPro.universityController.clear();
                       dashPro.cityController.clear();
                       for(int i=0; i<dashPro.interests.length;i++){
                         dashPro.interests[i].isSelected=false;

                       }
                      for(int i=0; i<dashPro.musicTaste.length;i++){
                        dashPro.musicTaste[i].isSelected=false;

                      }
                      for(int i=0; i<dashPro.formCheck.length;i++){
                         dashPro.formCheck[i]=-1;

                      }

                      Get.offAll(const Login());
                    }
                  },
                  backButton: dashPro.pageIndex == 0 ? false : true,
                  title: 'complete_profile'),
            ),
            bottomNavigationBar: Container(
              height: Get.width * 0.35,
              margin: EdgeInsets.only(left: Get.width * 0.07,right:Get.width * 0.07,bottom: Get.width*0.03),
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
                          onpressed: dashPro.pageIndex==2?(){

                             Get.dialog(
                                 DateDialogBox()).then((value)
                             {
                             if(value==true)
                               {
                                 dashPro.pageIndex++;
                                 dashPro.update();
                                 _controller.jumpToPage(dashPro.pageIndex);
                                 percentageValue(dashPro);
                               }
                             });

                          }:() {
                            dashPro.pageIndex++;
                            dashPro.update();
                            print(dashPro.pageIndex.toString());
                            if (dashPro.pageIndex <= 8) {
                              _controller.jumpToPage(dashPro.pageIndex);
                              percentageValue(dashPro);
                            }
                            else{
                              dashPro.pageIndex=0;
                              Get.bottomSheet(const CongraulationBottomSheet(
                                text: 'your_profile_has_been_completed',
                              ));
                              Future.delayed(Duration(seconds: 3),(){
                                Get.offAll(
                                    DashBoardScreen()
                                );
                              });
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
                            dashPro.pageIndex++;
                            dashPro.update();
                            print(dashPro.pageIndex.toString());
                              if (dashPro.pageIndex <= 8) {
                                _controller.jumpToPage(dashPro.pageIndex);
                                percentageValue(dashPro);
                              }
                              else{
                                Get.bottomSheet(const CongraulationBottomSheet(
                                  text: 'your_profile_has_been_completed',
                                ));
                                Future.delayed(Duration(seconds: 3),(){
                                  Get.to(
                                      DashBoardScreen()
                                  );
                                });
                              }
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
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.width * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
                child: Row(
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
                      style: AppTextStyle.mullerText(AppColors.lightGrey,
                          Get.width * 0.04, FontWeight.w400),
                    )
                  ],
                ),
              ),
              Form(
                key: dashPro.formKey,
                child: Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    children: [
                      const EmailScreen(),
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
      ));
    });
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
