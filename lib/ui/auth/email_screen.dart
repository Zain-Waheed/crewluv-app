import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/ui/auth/enter_dob.dart';
import 'package:amigos/ui/auth/favorite_drinks_screen.dart';
import 'package:amigos/ui/auth/fullname_screen.dart';
import 'package:amigos/ui/auth/interests.dart';
import 'package:amigos/ui/auth/media_profile_screen.dart';
import 'package:amigos/ui/auth/music_taste_screen.dart';
import 'package:amigos/ui/auth/select_gender.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:amigos/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'otp_screen.dart';

class EnterEmail extends StatefulWidget {
  const EnterEmail({Key? key}) : super(key: key);

  @override
  _EnterEmailState createState() => _EnterEmailState();
}

class _EnterEmailState extends State<EnterEmail> {
  TextEditingController emailController = TextEditingController();
  final _controller = PageController();
  final formKey = GlobalKey<FormState>();
  int pageIndex = 0;
  int percentage = 10;
  double percent = 0.1;
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.width * 0.17),
        child: CustomAppBar(
            function: () {
              //Get.to(() => const PhoneNumber());
              if (pageIndex > 0) {
                pageIndex--;
                percentageValue();
                _controller.jumpToPage(pageIndex);
              } else {
                pageIndex = 0;
                percentageValue();
                _controller.jumpToPage(pageIndex);
              }
            },
            backButton: pageIndex == 0 ? false : true,
            title: 'complete_profile'),
      ),
      bottomNavigationBar: Container(
        height: pageIndex==4||pageIndex==5||pageIndex==6?Get.width * 0.3:Get.width * 0.2,
        margin: EdgeInsets.symmetric(horizontal: Get.width*0.07),
        child: Column(
          children: [
          SizedBox(
                  height: Get.width*0.04,
          ),
            AppButton(
              isWhite: false,
              width: Get.width * 0.6,
              buttonText: pageIndex == 7 ? 'done' : 'further',
              onpressed: () {
                if (formKey.currentState!.validate()) {
                  pageIndex++;
                  percentageValue();
                  if (pageIndex <= 7) {
                    _controller.jumpToPage(pageIndex);
                  } else {
                    pageIndex = 7;
                    percentageValue();
                    _controller.jumpToPage(pageIndex);
                  }
                }
              },
            ),
           Visibility(
             visible: pageIndex==4||pageIndex==5||pageIndex==6?true:false,
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
                  key: formKey,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _controller,
                    onPageChanged: (index) {
                      setState(() {
                        pageIndex = index;
                      });
                    },
                    children: [
                      emailScreen(),
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
  }

  Widget emailScreen() {
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

  void percentageValue() {
    if (pageIndex == 0) {
      setState(() {
        percentage = 10;
        percent = 0.1;
      });
    } else if (pageIndex == 1) {
      setState(() {
        percentage = 20;
        percent = 0.2;
      });
    } else if (pageIndex == 2) {
      setState(() {
        percentage = 35;
        percent = 0.35;
      });
    } else if (pageIndex == 3) {
      setState(() {
        percentage = 50;
        percent = 0.5;
      });
    } else if (pageIndex == 4) {
      setState(() {
        percentage = 65;
        percent = 0.65;
      });
    } else if (pageIndex == 5) {
      setState(() {
        percentage = 75;
        percent = 0.75;
      });
    } else if (pageIndex == 6) {
      setState(() {
        percentage = 85;
        percent = 0.95;
      });
    } else if (pageIndex == 7) {
      setState(() {
        percentage = 95;
        percent = 1;
      });
    }
  }
}
