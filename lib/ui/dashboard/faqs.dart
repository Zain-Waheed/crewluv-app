import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/helpers/widgets/tabs_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Faqs extends StatefulWidget {
  const Faqs({Key? key}) : super(key: key);

  @override
  _FaqsState createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  PageController faqController = PageController();
  List<bool> selected=[true,false];

  @override
  Widget build(BuildContext context) {
   return Consumer<DashboardProvider> (builder: (context,provider,_){
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
                     height: Get.height*0.04,
                     width: Get.width*0.095,
                     margin: const EdgeInsets.symmetric(vertical: 10,),
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
                           size: Get.width*0.045,
                         ),
                       ),
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
                   GestureDetector(
                     onTap: (){},
                     child: Container(
                       decoration: BoxDecoration(
                           shape: BoxShape.rectangle,
                           color: AppColors.whiteColor,
                           borderRadius: BorderRadius.circular(12),
                           boxShadow: [
                             BoxShadow(
                                 color: AppColors.black.withOpacity(0.5), offset: Offset(0, 4), blurRadius: 5.0)
                           ]
                       ),

                       child: Padding(
                         padding: const EdgeInsets.all(4.0),
                         child: Icon(Icons.search_sharp,color: AppColors.black,size: Get.height*0.03,),
                       ),
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
           Container(
             decoration: BoxDecoration(
               border: Border.all(color: AppColors.genderBorder),
               borderRadius: BorderRadius.circular(20),
             ),
             child: ToggleButtons(
               fillColor: Colors.transparent,
               hoverColor: Colors.transparent,
               splashColor: Colors.transparent,
               borderRadius: BorderRadius.circular(20),
               constraints: BoxConstraints(
                 maxHeight: Get.height*0.05,
                 minHeight: Get.height*0.05,
                 maxWidth: Get.width*0.275,
                 minWidth: Get.width*0.237,


               ),renderBorder: false,
               isSelected:selected,
               onPressed: (x){
                 if(x==0){
                   provider.faqIndex=0;
                   provider.update();
                   selected[0]=true;
                   selected[1]=false;

                 }
                 else{
                   provider.faqIndex=1;
                   provider.update();
                   selected[1]=true;
                   selected[0]=false;

                 }
               },
               children: [
                 TabsWidget('faqs', selected[0]),
                 TabsWidget("what's new", selected[1]),
               ],
             ),
           ),
           SizedBox(
             height: Get.height*0.02,
           ),
           IndexedStack(
             index: provider.faqIndex,
             children: [
               Column(
                   children: List.generate(4, (index) => faqsWidget())
               ),
               SizedBox(),
             ],
           )
         ],
       ),
     );

   },);
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
