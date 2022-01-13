import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:share/share.dart';

class TicketDialogBox extends StatefulWidget {
  const TicketDialogBox({Key? key}) : super(key: key);

  @override
  _TicketDialogBoxState createState() => _TicketDialogBoxState();
}

class _TicketDialogBoxState extends State<TicketDialogBox> {
  CarouselController   carouselController = CarouselController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Scaffold(
        backgroundColor: AppColors.black.withOpacity(0.4),
        body: CarouselSlider(
          carouselController: carouselController,
          options: CarouselOptions(
            height: Get.height*0.8,
            aspectRatio: 16/9,
            viewportFraction: 0.8,
            initialPage: 0,
            reverse: false,
            autoPlay: false,
            onPageChanged: (index, pageReason) {
              pageIndex = index;
              setState(() {});

            },
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration:
            const Duration(milliseconds: 800),
            autoPlayCurve: Curves.ease,
            scrollDirection: Axis.horizontal,
          ),
          items: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Container(
                  width: Get.width*0.77,
                  padding: EdgeInsets.only(left: Get.width*0.05,right: Get.width*0.05,top: Get.width*0.05),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: Get.width*0.03,horizontal: Get.width*0.05),
                            margin: EdgeInsets.only(right: Get.width*0.025,top:Get.width*0.03 ),
                            decoration: BoxDecoration(
                              gradient: AppColors.orangeGradientColor,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.black.withOpacity(0.2), offset: const Offset(0, 4), blurRadius: 5.0)
                              ],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(getTranslated(context, 'party')??"",
                              style: AppTextStyle.montserrat(AppColors.white, Get.width*0.04, FontWeight.w400),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Share.share('CrewLuv');
                            },
                            child: Image.asset(AppImages.share,
                              width: Get.width*0.12,
                              height: Get.width*0.12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.width*0.04,
                      ),
                      Text(
                        getTranslated(context, 'bachelor_party')??"",
                        style: AppTextStyle.montserrat(
                          AppColors.shadedBlack,
                          Get.width*0.06,
                          FontWeight.w700,
                        ),
                      ),
                      Text(
                        getTranslated(context, 'crime_bar')??"",
                        style: AppTextStyle.montserrat(
                          AppColors.blackLite,
                          Get.width*0.045,
                          FontWeight.w400,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                        width: Get.width,
                        height: Get.height * 0.005,
                        decoration: BoxDecoration(
                            color: AppColors.slateGrey,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      Text(
                        getTranslated(context, 'place')??"",
                        style: AppTextStyle.montserrat(
                          AppColors.shadedBlack,
                          Get.width*0.045,
                          FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(AppImages.location,width: Get.width*0.04,height: Get.width*0.04,),
                          SizedBox(
                            width: Get.width*0.02,
                          ),
                          Text('342, Block D, wapdatown',
                            style: AppTextStyle.montserrat(
                              AppColors.greyDark,
                              Get.width*0.04,
                              FontWeight.w400,
                            ),),
                        ],
                      ),
                      SizedBox(
                        height: Get.width*0.04,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(getTranslated(context, 'date')??"",
                                style: AppTextStyle.montserrat(
                                  AppColors.shadedBlack,
                                  Get.width*0.045,
                                  FontWeight.w500,
                                ),),
                              Text('21-12-21',
                                style: AppTextStyle.montserrat(
                                  AppColors.themeColor,
                                  Get.width*0.045,
                                  FontWeight.w500,
                                ),),
                              SizedBox(
                                height: Get.width*0.02,
                              ),
                              Text(getTranslated(context, 'distance')??"",
                                style: AppTextStyle.montserrat(
                                  AppColors.shadedBlack,
                                  Get.width*0.045,
                                  FontWeight.w500,
                                ),),
                              Text('325 km',
                                style: AppTextStyle.montserrat(
                                  AppColors.themeColor,
                                  Get.width*0.045,
                                  FontWeight.w500,
                                ),),
                            ],
                          ),
                          SizedBox(
                            width: Get.width*0.25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(getTranslated(context, 'time')??"",
                                style: AppTextStyle.montserrat(
                                  AppColors.shadedBlack,
                                  Get.width*0.045,
                                  FontWeight.w500,
                                ),),
                              Text('14:30',
                                style: AppTextStyle.montserrat(
                                  AppColors.themeColor,
                                  Get.width*0.045,
                                  FontWeight.w500,
                                ),),
                              SizedBox(
                                height: Get.width*0.02,
                              ),
                              Text(getTranslated(context, 'id')??"",
                                style: AppTextStyle.montserrat(
                                  AppColors.shadedBlack,
                                  Get.width*0.045,
                                  FontWeight.w500,
                                ),),
                              Text('12345567',
                                style: AppTextStyle.montserrat(
                                  AppColors.themeColor,
                                  Get.width*0.045,
                                  FontWeight.w500,
                                ),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.width*0.04,
                      ),
                      Text(getTranslated(context, 'cost')??"",
                        style: AppTextStyle.montserrat(
                          AppColors.shadedBlack,
                          Get.width*0.045,
                          FontWeight.w500,
                        ),),
                      Text('\$123',
                        style: AppTextStyle.montserrat(
                          AppColors.themeColor,
                          Get.width*0.045,
                          FontWeight.w500,
                        ),),
                      SizedBox(
                        height: Get.width*0.15,
                      ),
                      const DottedLine(
                        direction: Axis.horizontal,
                        lineLength: double.infinity,
                        lineThickness: 1.0,
                        dashLength: 4.0,
                        dashColor: Colors.black,
                        dashRadius: 0.0,
                        dashGapLength: 4.0,
                        dashGapColor: Colors.transparent,
                        dashGapRadius: 0.0,
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: Get.width*0.09,right: Get.width*0.09,top: Get.width*0.07),
                        child: Image.asset(AppImages.barCode,width: Get.width*0.6,height: Get.width*0.3,),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
