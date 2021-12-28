import 'package:amigos/helpers/bottom_sheets/congratulation_bottomsheet.dart';
import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/app_button_grey.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/auth/enter_dob.dart';
import 'package:amigos/ui/auth/favorite_drinks_screen.dart';
import 'package:amigos/ui/auth/fullname_screen.dart';
import 'package:amigos/ui/auth/interests.dart';
import 'package:amigos/ui/auth/login_screen.dart';
import 'package:amigos/ui/auth/media_profile_screen.dart';
import 'package:amigos/ui/auth/music_taste_screen.dart';
import 'package:amigos/ui/auth/select_gender.dart';
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

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  TextEditingController emailController = TextEditingController();
  final _controller = PageController();

  
  int percentage = 10;
  double percent = 0.1;
  bool isChecked = true;
  bool isGrey=true;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context,dashPro,_)
    {
      return Scaffold(
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
                  Get.to(
                      Login()
                  );
                }
              },
              backButton: dashPro.pageIndex == 0 ? false : true,
              title: 'complete_profile'),
        ),
        bottomNavigationBar: Container(
          height: dashPro.pageIndex==4||dashPro.pageIndex==5||dashPro.pageIndex==6?Get.width * 0.3:Get.width * 0.2,
          margin: EdgeInsets.symmetric(horizontal: Get.width*0.07),
          child: Column(
            children: [
              SizedBox(
                height: Get.width*0.04,
              ),
              dashPro.formCheck[dashPro.pageIndex]==1?AppButton(
                isWhite: false,
                width: Get.width * 0.9,
                buttonText: dashPro.pageIndex == 7 ? 'done' : 'further',
                onpressed: () {
                  if (dashPro.formKey.currentState!.validate()) {
                    dashPro.pageIndex++;
                    percentageValue(dashPro);
                    if (dashPro.pageIndex <= 7) {
                      _controller.jumpToPage(dashPro.pageIndex);
                    } else {
                      percentageValue(dashPro);
                      Get.bottomSheet(
                        CongraulationBottomSheet()
                      );
                     Future.delayed(Duration(seconds: 2),(){
                       Get.to(DashBoardScreen());
                     });
                    }
                  }
                },
              ): ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(Size(400, 50)),
                  backgroundColor: MaterialStateProperty.all(AppColors.solidGrey),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: null,
                child: Text(getTranslated(context, 'further')??"",
                  style: AppTextStyle.montserrat(AppColors.whiteColor, Get.width*0.04, FontWeight.w600)
                  ,),
              ),
              Visibility(
                visible: dashPro.pageIndex==4||dashPro.pageIndex==5||dashPro.pageIndex==6?true:false,
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.width*0.01,
                    ),
                    TextButton(
                      onPressed: () {
                        _controller.jumpToPage(7);
                      },
                      child: Text(
                        getTranslated(context, 'skip_this_step') ?? "",
                        style: AppTextStyle.poppins(
                            AppColors.orangeDark, Get.width * 0.04, FontWeight.w500),
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
          child: SingleChildScrollView(
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
                        fillColor: AppColors.grey,
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
                      style: AppTextStyle.montserrat(
                          AppColors.lightGrey, Get.width * 0.04, FontWeight.w300),
                    )
                  ],
                ),
                SizedBox(
                  width: Get.width,
                  height: Get.width * 1.5,
                  child: Form(
                    key: dashPro.formKey,
                   // autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _controller,
                      onPageChanged: (index) {
                        setState(() {
                          dashPro.pageIndex = index;
                        });
                      },
                      children: [
                        emailScreen(dashPro),
                        EnterFullName(),
                        EnterDOB(),
                        SelectGender(),
                        FavoriteDrinks(),
                        MusicTaste(),
                        Intersets(),
                        MediaProfile(),
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
    return Column(
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
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: emailController,
          onChanged: (val){

            setState(() {
              if(dashPro.formKey.currentState!.validate())
                {
                  dashPro.formCheck[dashPro.pageIndex]=1;
                }
              else
                {
                  dashPro.formCheck[dashPro.pageIndex]=-1;
                }
            });
          },
          validator: (value) =>
              FieldValidator.validateEmail(emailController.text),
          decoration: AppInputDecoration.circularFieldDecoration(
            null,
            'enter_email',
            Image.asset(
              AppImages.emailIcon,
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
        percentage = 35;
        percent = 0.35;
      });
    } else if (dashPro.pageIndex == 3) {
      setState(() {
        percentage = 50;
        percent = 0.5;
      });
    } else if (dashPro.pageIndex == 4) {
      setState(() {
        percentage = 65;
        percent = 0.65;
      });
    } else if (dashPro.pageIndex == 5) {
      setState(() {
        percentage = 75;
        percent = 0.75;
      });
    } else if (dashPro.pageIndex == 6) {
      setState(() {
        percentage = 85;
        percent = 0.95;
      });
    } else if (dashPro.pageIndex == 7) {
      setState(() {
        percentage = 95;
        percent = 1;
      });
    }
  }
}
