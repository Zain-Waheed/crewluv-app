import 'package:amigos/helpers/bottom_sheets/further_subscription.dart';
import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GetPlanDialogBox extends StatefulWidget {
  
  @override
  _GetPlanDialogBoxState createState() => _GetPlanDialogBoxState();
}

class _GetPlanDialogBoxState extends State<GetPlanDialogBox> {
  CarouselController   carouselController = CarouselController();
  final _controller = PageController();
  int pageIndex = 0;
  List <int> months=[
    12,
    11,
    10,
  ];
  List <int> pricePerMonth=[
     4,
     3,
     2,
  ];
  List <double> price=[
    97.99,
    97.98,
    97.95,
  ];
  List <bool> isPopular=[
    true,
    false,
    false,
  ];
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xff999999),Color(0xffBA8E2E)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 70.0, 200.0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black.withOpacity(0.4),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width*0.9,
            padding: EdgeInsets.symmetric(vertical: Get.width*0.05,horizontal: Get.width*0.05),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Text(
                  getTranslated(context, 'get_premium_plan')??"",
                  style: AppTextStyle.montserrat(
                      AppColors.themeColor,
                      Get.width*0.045,
                      FontWeight.w700,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.subscription,width: Get.width*0.08,height: Get.height*0.08,),
                    SizedBox(
                      width: Get.width*0.01,
                    ),
                    Text(getTranslated(context, 'intro_text')??"",
                      style: AppTextStyle.montserrat(
                          AppColors.blackLite,
                          Get.width*0.045,
                          FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width*0.06,
                  ),
                  child: Text(AppDummyData.shortText,
                    style: AppTextStyle.montserrat(
                      AppColors.blackLite,
                      Get.width*0.04,
                      FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: Get.width*0.045,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => Container(
                    width: pageIndex == index ? Get.width*0.09 : Get.width * 0.015,
                    height:pageIndex == index ? Get.width*0.03:Get.width * 0.015 ,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: pageIndex == index ? AppColors.themeColor : AppColors.grey
                    ),
                  )),
                ),
                SizedBox(
                  height: Get.width*0.07,
                ),
                CarouselSlider(
                  carouselController: carouselController,
                  options: CarouselOptions(
                    height: Get.width*0.45,
                    enlargeCenterPage:true,
                    aspectRatio: 2.8 / 1,
                    viewportFraction: 0.39,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    onPageChanged: (index, pageReason) {
                      pageIndex = index;
                      setState(() {});

                    },
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                    const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  ),
                  items:  List.generate(
                      3, (index) => priceWidget(months[index], pricePerMonth[index], price[index],isPopular[index],index),
                  ),
                ),
                SizedBox(
                  height: Get.width*0.045,
                ),
                AppButton(buttonText: 'further', onpressed:(){ Get.bottomSheet(FurtherSubscription());}, width: Get.width*0.7, isWhite: false),
                TextButton(onPressed: (){Get.back();},
                    child: Text(
                      getTranslated(context, 'no_thanks')??"",
                      style: AppTextStyle.
                      montserrat(
                          AppColors.lightGrey,
                          Get.width*0.04,
                          FontWeight.w600,
                      ),
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  priceWidget(int months,int pricePerMonth,double price,bool isPopular,int index) {
  return  Container(
    decoration:pageIndex==index? BoxDecoration(
      gradient: AppColors.brownGradient,
      borderRadius: BorderRadius.circular(16),
    ):const BoxDecoration(),
    child: Stack(
      children: [
        SizedBox(
          height: Get.width*0.5,
          child: Card(
            semanticContainer: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: Get.width*0.04,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.width*0.045,
                    ),
                    Text(
                      months.toString(),
                      style: AppTextStyle.
                      montserrat(
                        AppColors.shadedBlack,
                        Get.width*0.07,
                        FontWeight.w600,
                      ),
                    ),
                    Text(
                      getTranslated(context, 'months')??"",
                      style: AppTextStyle.
                      montserrat(
                        AppColors.shadedBlack,
                        Get.width*0.035,
                        FontWeight.w600,
                      ),
                    ),
                    Text(
                      "\$"+pricePerMonth.toString()+"/mo",
                      style: AppTextStyle.
                      montserrat(
                        AppColors.slateGrey,
                        Get.width*0.035,
                        FontWeight.w400,
                      ),
                    ),
                    Text(
                      "${getTranslated(context, 'save')} 50\%",
                      style: AppTextStyle.
                      montserrat(
                        AppColors.shadedBlack,
                        Get.width*0.04,
                        FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$'+price.toString(),
                      style: GoogleFonts.montserrat(
                          fontSize:Get.width*0.06,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: pageIndex==index,
          child: Container(
            height: Get.width*0.06,
            width: Get.width,
            alignment: Alignment.center,
            decoration:  BoxDecoration(
               gradient: AppColors.brownGradient,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                )
            ),
              child: Text(isPopular?getTranslated(context, 'most_popular')??"":"",
              style: AppTextStyle.montserrat(
                  AppColors.white,
                  Get.width*0.035,
                  FontWeight.w600,
              ),
              ),
          ),
        ),
      ],
    ),
  );
  }

}
