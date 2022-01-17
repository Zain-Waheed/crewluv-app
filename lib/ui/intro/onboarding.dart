import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/ui/auth/login_screen.dart';
import 'package:amigos/ui/auth/phone_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final _controller = PageController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.onBoardingBackground),
            fit: BoxFit.cover,
          ),),
        child: Column(
          children: [
            SizedBox(
              height: Get.width*0.1,
            ),
            Expanded(
              flex: 6,
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                children: [
                  Image.asset(
                    AppImages.onBoarding1,scale: 1,
                  ),
                  Image.asset(
                    AppImages.onBoarding2,
                  ),
                  Image.asset(
                    AppImages.onBoarding3,
                  ),
                  Image.asset(
                    AppImages.onBoarding4,
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: Get.width*0.07,bottom: Get.width*0.09),
              child: SmoothPageIndicator(
                count: 4,
                effect: ExpandingDotsEffect(
                  expansionFactor: Get.width*0.01,
                  strokeWidth: Get.width*0.02,
                  dotColor: AppColors.white,
                  dotWidth: Get.width * 0.02,
                  dotHeight: Get.width * 0.02,
                  spacing: Get.width * 0.01,
                  activeDotColor: AppColors.white,
                ),
                controller: _controller,
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: Get.height*0.0002),
                    Text(
                      titleText(),
                      style: AppTextStyle.montserrat(
                          AppColors.black, Get.width * 0.05, FontWeight.bold),
                    ),
                    Text(
                      descriptionText(),
                      style: AppTextStyle.montserrat(AppColors.blackLite,
                          Get.width * 0.04, FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: Get.height*0.0002),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppButton(
                          onpressed: () {
                            if(pageIndex<3)
                            {
                              pageIndex=3;
                              _controller.jumpToPage(pageIndex);
                            }else
                            {
                              pageIndex=4;
                              Get.to(const Login());
                            }
                          },
                          buttonText: pageIndex==3?'login':'skip',
                          width: Get.width * 0.35,
                          isWhite: true,
                        ),
                        AppButton(
                          onpressed: () {
                            pageIndex++;
                            if(pageIndex<=3)
                            {
                              _controller.jumpToPage(pageIndex);
                            }else
                            {
                              pageIndex=4;
                              Get.offAll(const PhoneNumber());
                            }
                          },
                          buttonText: pageIndex==3?'register':'next',
                          width: Get.width * 0.35,
                          isWhite: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  String titleText() {
    if (pageIndex == 0) {
      return AppDummyData.titleOnBoarding1;
    } else if (pageIndex == 1) {
      return AppDummyData.titleOnBoarding2;
    } else if (pageIndex == 2) {
      return AppDummyData.titleOnBoarding3;
    } else if (pageIndex == 3) {
      return AppDummyData.titleOnBoarding4;
    } else {
      return '';
    }
  }

  String descriptionText() {
    if (pageIndex == 0) {
      return AppDummyData.mediumText;
    } else if (pageIndex == 1) {
      return AppDummyData.mediumText;
    } else if (pageIndex == 2) {
      return AppDummyData.mediumText;
    } else if (pageIndex == 3) {
      return AppDummyData.mediumText;
    } else {
      return '';
    }
  }
}
