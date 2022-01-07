import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Faqs extends StatefulWidget {
  const Faqs({Key? key}) : super(key: key);

  @override
  _FaqsState createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  int faqIndex=0;
  PageController faqController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height*0.17),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width*0.05),
          decoration:  BoxDecoration(
            gradient: AppColors.buttonGradientColor,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Get.height*0.032,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.black.withOpacity(0.5), offset: Offset(0, 4), blurRadius: 5.0)
                        ]
                    ),

                    child: IconButton(

                      onPressed: (){
                        Get.back();
                      },
                      icon:Icon(Icons.arrow_back_ios,color: AppColors.black,),

                    ),
                  ),
                  Text(getTranslated(context,'faqs')??"",style: AppTextStyle.montserrat(AppColors.black, Get.width*0.04, FontWeight.w500),),
                  Container(
                    margin:  const EdgeInsets.symmetric(vertical: 12 , horizontal: 15),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),

                    ),


                  ),
                ],
              ),
              SizedBox(height: Get.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(getTranslated(context,'top_questions')??"",style: AppTextStyle.montserrat(AppColors.whiteColor, Get.width*0.04, FontWeight.w500),),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.black.withOpacity(0.5), offset: Offset(0, 4), blurRadius: 5.0)
                        ]
                    ),

                    child: IconButton(

                      onPressed: (){},
                      icon:Icon(Icons.search_sharp,color: AppColors.black,),

                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Get.height*0.02,
          ),
          ToggleButtons(
            borderRadius: BorderRadius.circular(20),
            constraints: BoxConstraints(
              maxHeight: Get.height*0.05,
              minHeight: Get.height*0.05,
              maxWidth: Get.width*0.275,
              minWidth: Get.width*0.237,

            ),renderBorder: false,
            isSelected: [true,false],
            children: [
              GestureDetector(
                onTap: () {
                  faqIndex = 0;
                  faqController.jumpToPage(faqIndex);
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: faqIndex == 0
                        ? AppColors.themeColor
                        : AppColors.offWhite,
                  ),
                  child: Center(
                      child: Text(
                        getTranslated(context, "faqs") ?? "",
                        style: AppTextStyle.montserrat(
                            faqIndex == 0
                                ? AppColors.whiteColor
                                : AppColors.shadedBlack,
                            Get.width * 0.035,
                            FontWeight.w400),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  faqIndex = 1;
                  faqController.jumpToPage(faqIndex);
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: faqIndex == 1
                        ? AppColors.themeColor
                        : AppColors.offWhite,
                  ),
                  child: Center(
                      child: Text(
                        getTranslated(context,"what's new") ?? "",
                        style: AppTextStyle.montserrat(
                            faqIndex == 1
                                ? AppColors.whiteColor
                                : AppColors.shadedBlack,
                            Get.width * 0.035,
                            FontWeight.w400),
                      )),
                ),
              ),

            ],
          ),
          SizedBox(
            height: Get.height*0.02,
          ),
          SingleChildScrollView(
            child: Column(
                children: List.generate(4, (index) => faqsWidget())
            ),
          ),
        ],
      ),
    );
  }
  Widget faqsWidget(){
   return  Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.01),
      padding: EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical: Get.height*0.005),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
                color: AppColors.opacBlack,offset: Offset(0,2),blurRadius: 5
            )
          ]

      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: AppColors.shadedBlack,
          title: Text('what is crewLuv',style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),textAlign: TextAlign.start,),
          children: [
            Text(AppDummyData.mediumText,style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w400),textAlign: TextAlign.start,),
          ],

        ),
      ),
    );

  }
}
