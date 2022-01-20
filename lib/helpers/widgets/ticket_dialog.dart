import 'package:amigos/helpers/bottom_sheets/edit_gender_bottomsheet.dart';
import 'package:amigos/helpers/widgets/ticket_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/dashboard.dart';
import 'package:amigos/ui/dashboard/send_invite.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:provider/provider.dart';
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
    return
    Consumer<DashboardProvider>(builder: (context,provider,_){
      return GestureDetector(
        onTap: (){
          Navigator.of(context).pop();
        },
        child: Scaffold(
          backgroundColor: AppColors.black.withOpacity(0.4),
          body: CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: Get.height*0.85,
                aspectRatio: 1/9,
                viewportFraction: 0.9,
                initialPage: 0,
                reverse: false,
                autoPlay: false,
                  enableInfiniteScroll:false,
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
              items: List.generate(provider.tickets.length, (index){
                return   Container(
                  // color: Colors.red,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      child: CustomPaint(
                        size: Size(Get.width*0.85,(Get.width*0.9*1.6720508156717429).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: RPSCustomPainter(),
                        child: Container(
                          padding: EdgeInsets.only(left: Get.width*0.04,right: Get.width*0.04,top: Get.width*0.05,bottom:Get.width*0.09 ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: Get.width*0.08,
                                    width: Get.width*0.2,
                                    alignment: Alignment.center,
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
                                    child: Container(
                                      width: Get.width*0.12,
                                      height: Get.width*0.12,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(right: Get.width*0.1),
                                      child: Image.asset(AppImages.share,),
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
                                  Get.width*0.05,
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
                                width: Get.width*0.68,
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
                                  Text(provider.tickets[index].location??"",
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
                                      Text(provider.tickets[index].date??"",
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
                                      Text(provider.tickets[index].distance.toString()+'km',
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
                                      Text(provider.tickets[index].time??"",
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
                                      Text(provider.tickets[index].id.toString(),
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
                              Text('\$'+provider.tickets[index].cost.toString(),
                                style: AppTextStyle.montserrat(
                                  AppColors.themeColor,
                                  Get.width*0.045,
                                  FontWeight.w500,
                                ),),
                              SizedBox(
                                height: Get.width*0.1,
                              ),
                              DottedLine(
                                direction: Axis.horizontal,
                                lineLength: Get.width*0.7,
                                lineThickness: 1.0,
                                dashLength: 4.0,
                                dashColor: Colors.black,
                                dashRadius: 0.0,
                                dashGapLength: 4.0,
                                dashGapColor: Colors.transparent,
                                dashGapRadius: 0.0,
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: Get.width*0.1,right: Get.width*0.09,top: Get.width*0.03),
                                child: Image.asset(AppImages.barCode,width: Get.width*0.5,height: Get.width*0.3,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              })
          ),
        ),
      );
    });
  }
}