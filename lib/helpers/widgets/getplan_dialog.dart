import 'package:amigos/helpers/bottom_sheets/further_subscription.dart';
import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/plan_model.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GetPlanDialogBox extends StatefulWidget {
  
  @override
  _GetPlanDialogBoxState createState() => _GetPlanDialogBoxState();
}

class _GetPlanDialogBoxState extends State<GetPlanDialogBox> {
  CarouselController   carouselController = CarouselController();
  PageController controller = PageController();
  int pageIndex=0;
  final _controller = PageController();
  // List <int> months=[
  //   12,
  //   11,
  //   10,
  // ];
  // List <int> pricePerMonth=[
  //    4,
  //    3,
  //    2,
  // ];
  // List <double> price=[
  //   97.99,
  //   97.98,
  //   97.95,
  // ];
  // List <bool> isPopular=[
  //   false,
  //   true,
  //   false,
  // ];
  int currentIndex=1;
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
            padding: EdgeInsets.symmetric(vertical: Get.width*0.05),
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
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: Get.width*0.3,
                        child: PageView(
                            controller: controller,
                            onPageChanged: (value){
                              pageIndex = value;
                              setState(() {
                              });
                            },
                            children:List.generate(5, (index) =>  Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.brownColor,
                                      ),
                                      child: Image.asset(AppImages.subscription,width: Get.width*0.07,height: Get.height*0.07,)),
                                  SizedBox(
                                    width: Get.width*0.01,
                                  ),
                                  Text('intro Text',
                                    style: AppTextStyle.montserrat(
                                      AppColors.blackLite,
                                      Get.width*0.045,
                                      FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: Get.width*0.06,),
                                child: Text(AppDummyData.shortText,
                                  style: AppTextStyle.montserrat(
                                    AppColors.blackLite,
                                    Get.width*0.04,
                                    FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.left,
                                ),)

                            ],))

                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.width*0.045,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) => Container(
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    plans.length, (index) => priceWidget(plans[index],index),
                  ),
                ),

                SizedBox(
                  height: Get.width*0.045,
                ),
                AppButton(buttonText: 'further', onpressed:(){
                  Get.back();
                  Get.bottomSheet(FurtherSubscription());}, width: Get.width*0.7, isWhite: false),
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

  priceWidget(PlanModel plans,int index) {
  return  GestureDetector(
    onTap:(){
      currentIndex=index;
      setState(() {

      });
    },
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width*0.01),
      child: Stack(
        children: [
          SizedBox(
            height: plans.isPopular?Get.width*0.45:Get.width*0.35,
            width: plans.isPopular?Get.width*0.3:Get.width*0.27,
            child: Container(
              decoration:currentIndex==index?BoxDecoration(
            gradient: AppColors.brownGradient,
              borderRadius: BorderRadius.circular(14),
            ):const BoxDecoration(),
              child: plans.isPopular?Card(
                semanticContainer: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(14),
                  ),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: Get.width*0.01
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height*0.03,
                      ),
                      Text(
                        plans.months.toString(),
                        style: AppTextStyle.
                        montserrat(
                          AppColors.shadedBlack,
                          Get.width*0.07,
                          FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: Get.width*0.005,
                      ),
                      Text(
                        getTranslated(context, 'months')??"",
                        style: AppTextStyle.
                        montserrat(
                          AppColors.shadedBlack,
                          Get.width*0.04,
                          FontWeight.w600,
                        ),
                      ),
                      Text(
                        "\$"+plans.pricePerMonth.toString()+"/mo",
                        style: AppTextStyle.
                        montserrat(
                          AppColors.slateGrey,
                          Get.width*0.04,
                          FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: Get.width*0.008),
                        child: Text(
                          "${getTranslated(context, 'save')} 50\%",
                          style: AppTextStyle.
                          montserrat(
                            AppColors.shadedBlack,
                            Get.width*0.04,
                            FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        '\$'+plans.price.toString(),
                        style: GoogleFonts.montserrat(
                            fontSize:Get.width*0.065,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = linearGradient),
                      ),
                      SizedBox(
                        height: Get.height*0.01,
                      ),
                    ],
                  ),
                ),
              ): Card(
                semanticContainer: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(14),
                  ),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: Get.width*0.012,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.width*0.045,
                      ),
                      Text(
                        plans.months.toString(),
                        style: AppTextStyle.
                        montserrat(
                          AppColors.shadedBlack,
                          Get.width*0.06,
                          FontWeight.w600,
                        ),
                      ),
                      Text(
                        getTranslated(context, 'months')??"",
                        style: AppTextStyle.
                        montserrat(
                          AppColors.shadedBlack,
                          Get.width*0.03,
                          FontWeight.w600,
                        ),
                      ),
                      Text(
                        "\$"+plans.pricePerMonth.toString()+"/mo",
                        style: AppTextStyle.
                        montserrat(
                          AppColors.slateGrey,
                          Get.width*0.03,
                          FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${getTranslated(context, 'save')} 50\%",
                        style: AppTextStyle.
                        montserrat(
                          AppColors.shadedBlack,
                          Get.width*0.03,
                          FontWeight.w600,
                        ),
                      ),
                      Text(
                        '\$'+plans.price.toString(),
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
          plans.isPopular?Container(
            height: Get.width*0.06,
            width: Get.width*0.3,
            alignment: Alignment.center,
            decoration:  BoxDecoration(
               gradient: AppColors.brownGradient,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                )
            ),
              child: Text(index==1?getTranslated(context, 'most_popular')??"":"",
              style: AppTextStyle.montserrat(
                  AppColors.white,
                  Get.width*0.035,
                  FontWeight.w600,
              ),
              ),
          ):SizedBox(),
        ],
      ),
    ),
  );
  }

}
