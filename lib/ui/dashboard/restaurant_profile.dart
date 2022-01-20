import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/app_button_small.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/dashboard.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RestaurantProfile extends StatefulWidget {
  const RestaurantProfile({Key? key}) : super(key: key);

  @override
  _RestaurantProfileState createState() => _RestaurantProfileState();
}

class _RestaurantProfileState extends State<RestaurantProfile> {
  int index=0;
  bool opened=true;
  bool liked=false;
  PageController controller =PageController();
  PageController controller2= PageController();
  List<String> drinks=[
    "whisky","Pepsi","Mint Margrita"
  ];
  List<String> music=[
    "jazz","Pop","Hip Hop"
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context,provider,_){
      return Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(
              top: Get.width * 0.099, left: Get.width * 0.06,),
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                height: Get.height*0.05,
                width: Get.width*0.09,
                // margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                // padding: EdgeInsets.only(top: 4,right: 4,bottom: 4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.black.withOpacity(0.5),
                          offset: Offset(0, 1),
                          blurRadius: 2)
                    ]
                ),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.black,
                      size: Get.width*0.04,
                    ),
                  ),
                ),
              ),
              onPressed: () {  },
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: Get.height*0.4,
              child: PageView(
                controller: controller2,
                children: List.generate(2, (index) =>   Container(
                  width: Get.width,
                  padding: EdgeInsets.only(
                    top: Get.width * 0.099, left: Get.width * 0.06,),
                  decoration: BoxDecoration(
                    gradient:AppColors.blackGradien,
                    image: DecorationImage(
                      scale: 5,
                      image: AssetImage(AppImages.restaurantProfile,),
                      fit: BoxFit.cover,
                    ),

                  ),

                ),)
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: Get.height*0.35),
                child: SmoothPageIndicator(
                  count: 2,
                  effect: ExpandingDotsEffect(
                    expansionFactor: 4.5,
                    strokeWidth: 2,
                    dotColor: AppColors.whiteColor,
                    dotWidth: Get.width * 0.02,
                    dotHeight: Get.width * 0.02,
                    spacing: Get.width * 0.01,
                    activeDotColor: AppColors.whiteColor,
                  ),
                  controller: controller2,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: Get.width,
                height: Get.height * .6,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02,vertical: Get.width*0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.themeColor,width: 2),
                              shape: BoxShape.circle,
                            ),
                            child:Image.asset(AppImages.bbqImage,height: Get.width*0.1,width: Get.width*0.1,fit: BoxFit.cover,),
                          ),
                          SizedBox(width: Get.width*0.05,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('BarBQue Restaurant',style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(width: Get.width*0.35,),
                                      GestureDetector(
                                          onTap: (){
                                            liked = !liked;
                                            setState(() {

                                            });

                                          },
                                          child: Image.asset(AppImages.like,scale: 3,color: liked?AppColors.themeColor:AppColors.slateGrey,)),
                                      SizedBox(height: Get.width*0.01,),
                                      Text('263 ${getTranslated(context, 'likes')}',style: AppTextStyle.montserrat(AppColors.eventBlack, Get.width*0.03,FontWeight.w500),),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(AppImages.location,scale: 3,),
                                  SizedBox(width: Get.width*0.01,),
                                  Text('16miles away',style: AppTextStyle.montserrat(AppColors.eventBlack, Get.width*0.04, FontWeight.w400),),

                                ],
                              ),

                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.width * 0.05,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: Get.width * 0.1,
                          width: Get.width * 0.9,
                          margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.genderBorder),
                              color: AppColors.offWhite),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    index = 0;
                                    controller.jumpToPage(index);
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: index == 0
                                          ? AppColors.themeColor
                                          : AppColors.offWhite,
                                    ),
                                    child: Center(
                                        child: Text(
                                          getTranslated(context, "overview") ?? "",
                                          style: AppTextStyle.montserrat(
                                              index == 0
                                                  ? AppColors.whiteColor
                                                  : AppColors.shadedBlack,
                                              Get.width * 0.035,
                                              FontWeight.w400),
                                        )),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    index = 1;
                                    controller.jumpToPage(index);
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: index == 1
                                          ? AppColors.themeColor
                                          : AppColors.offWhite,
                                    ),
                                    child: Center(
                                        child: Text(
                                          getTranslated(context, 'menu') ?? "",
                                          style: AppTextStyle.montserrat(
                                              index == 1
                                                  ? AppColors.whiteColor
                                                  : AppColors.shadedBlack,
                                              Get.width * 0.035,
                                              FontWeight.w400),
                                        )),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    index = 3;
                                    controller.jumpToPage(index);
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: index == 3
                                          ? AppColors.themeColor
                                          : AppColors.offWhite,
                                    ),
                                    child: Center(
                                        child: Text(
                                          getTranslated(context, 'reviews') ?? "",
                                          style: AppTextStyle.montserrat(
                                              index == 3
                                                  ? AppColors.whiteColor
                                                  : AppColors.shadedBlack,
                                              Get.width * 0.035,
                                              FontWeight.w400),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height*0.02,),
                      Expanded(
                        child: PageView(
                          controller: controller,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(getTranslated(context, 'details')??'',style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),),
                                  SizedBox(height: Get.height*0.02,),

                                  Row(
                                    children: [
                                      Image.asset(AppImages.time,scale: 2.2,),
                                      SizedBox(width: Get.width*0.05,),
                                      Text("${getTranslated(context, opened?'open':'closed')}",style: AppTextStyle.montserrat(opened?AppColors.themeColor:AppColors.eventBlack, Get.width*0.035, FontWeight.w500),),
                                      Text("- ${getTranslated(context,'closes')}: 12:00PM ",style: AppTextStyle.montserrat(AppColors.eventBlack, Get.width*0.035, FontWeight.w500),),

                                    ],
                                  ),
                                  SizedBox(height: Get.width*.04,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Image.asset(AppImages.phone,scale: 2.2,),
                                      SizedBox(width: Get.width*0.05,),
                                      Text("0323-6478392",style: AppTextStyle.montserrat(AppColors.eventBlack, Get.width*0.035, FontWeight.w500),),

                                    ],
                                  ),
                                  SizedBox(height: Get.width*.04,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Image.asset(AppImages.location,scale: 2.2,),
                                      SizedBox(width: Get.width*0.05,),
                                      Text("236, D block, Wapda Town, Lahore",style: AppTextStyle.montserrat(AppColors.eventBlack, Get.width*0.035, FontWeight.w500),),


                                    ],
                                  ),
                                  SizedBox(height: Get.width*.04,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Image.asset(AppImages.global,scale: 2.2,),
                                      SizedBox(width: Get.width*0.04,),
                                      Text("www.barbque.com",style: AppTextStyle.montserrat(AppColors.eventBlack, Get.width*0.035, FontWeight.w500),),


                                    ],
                                  ),
                                  SizedBox(height: Get.width*.03,),
                                  Text(getTranslated(context, 'about')??'',style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),),
                                  SizedBox(height: Get.width*.02,),
                                  Text(AppDummyData.mediumText,style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.035, FontWeight.w500),),
                                  SizedBox(height: Get.width*.02,),
                                  Text(getTranslated(context, 'drinks')??'',style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),),
                                  SizedBox(height: Get.width*.01,),
                                  Center(
                                     child: Wrap(

                                       children: List.generate(3, (index) =>Container(
                                         padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: 10),
                                         margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(20),
                                           gradient: AppColors.buttonGradientColor

                                         ),
                                         child: Text(drinks[index],style: AppTextStyle.montserrat(AppColors.whiteColor, Get.width*0.035, FontWeight.w500),),
                                       ) ),

                                     ),
                                   ),
                                  SizedBox(height: Get.width*.02,),
                                  Text(getTranslated(context, 'music_availability')??'',style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w500),),
                                  SizedBox(height: Get.width*.01,),
                                  Center(
                                    child: Wrap(

                                      children: List.generate(3, (index) =>Container(
                                        padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: 10),
                                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            gradient: AppColors.buttonGradientColor

                                        ),
                                        child: Text(music[index],style: AppTextStyle.montserrat(AppColors.whiteColor, Get.width*0.035, FontWeight.w500),),
                                      ) ),

                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppButton(buttonText: 'view_menu', onpressed: (){}, width: Get.width*0.8, isWhite: false)

                              ],
                            ),
                            Column(
                               children: [],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });

  }
}
