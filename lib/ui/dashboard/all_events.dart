import 'package:amigos/helpers/widgets/event_description_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/event_details.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


int allEventsIndex=0;
PageController allEventsController = PageController();
class AllEvents extends StatefulWidget {
  const AllEvents({Key? key}) : super(key: key);

  @override
  _AllEventsState createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  TabController?   tabController;

  @override
  Widget build(BuildContext context) {
   return Consumer<DashboardProvider>(builder:(context,provider,_)
       {
         return Scaffold(
           backgroundColor: AppColors.whiteBackground,
           appBar: AppBar(
             title: Text(getTranslated(context, "events")??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),),
             centerTitle: true,
             elevation: 0,
             backgroundColor: AppColors.whiteColor,
           ),
           body: Column(
             children: [
               // Container(
               //   height: Get.width*0.11,
               //   width: Get.width*0.9,
               //   margin: EdgeInsets.symmetric(horizontal: Get.width*0.05),
               //   decoration: BoxDecoration(
               //       borderRadius: BorderRadius.circular(20),
               //       border: Border.all(color: AppColors.genderBorder),
               //       color: AppColors.offWhite
               //   ),
               //   child: Row(
               //     children: [
               //       Expanded(
               //         child: GestureDetector(
               //           onTap: (){
               //             allEventsIndex=0;
               //             allEventsController.jumpToPage(allEventsIndex);
               //             setState(() {
               //
               //             });
               //           },
               //           child: Container(
               //             decoration: BoxDecoration(
               //               borderRadius: BorderRadius.circular(20),
               //               color: allEventsIndex==0?AppColors.themeColor:AppColors.offWhite,
               //             ),
               //             child: Center(child: Text(getTranslated(context, "my_events")??"",style: AppTextStyle.montserrat(allEventsIndex==0?AppColors.whiteColor:AppColors.shadedBlack, Get.width*0.04, FontWeight.w400),)),
               //           ),
               //         ),
               //       ),
               //       Expanded(
               //         child: GestureDetector(
               //           onTap: (){
               //             allEventsIndex=1;
               //             allEventsController.jumpToPage(allEventsIndex);
               //             setState(() {
               //
               //             });
               //           },
               //           child: Container(
               //             decoration: BoxDecoration(
               //               borderRadius: BorderRadius.circular(20),
               //               color: allEventsIndex==1?AppColors.themeColor:AppColors.offWhite,
               //             ),
               //             child: Center(child: Text(getTranslated(context, 'joined')??"",style: AppTextStyle.montserrat(allEventsIndex==1?AppColors.whiteColor:AppColors.shadedBlack, Get.width*0.04, FontWeight.w400),)),
               //           ),
               //         ),
               //       ),
               //       Expanded(
               //         child: GestureDetector(
               //           onTap: (){
               //             allEventsIndex=2;
               //             allEventsController.jumpToPage(allEventsIndex);
               //             setState(() {
               //
               //             });
               //           },
               //           child: Container(
               //             decoration: BoxDecoration(
               //               borderRadius: BorderRadius.circular(20),
               //               color: allEventsIndex==2?AppColors.themeColor:AppColors.offWhite,
               //             ),
               //             child: Center(child: Text(getTranslated(context, "pending2")??"",style: AppTextStyle.montserrat(allEventsIndex==2?AppColors.whiteColor:AppColors.shadedBlack, Get.width*0.04, FontWeight.w400),)),
               //           ),
               //         ),
               //       ),
               //     ],
               //   ),
               // ),
               ToggleButtons(
                 borderRadius: BorderRadius.circular(20),
                 constraints: BoxConstraints(
                   maxHeight: Get.height*0.05,
                   minHeight: Get.height*0.05,
                   maxWidth: Get.width*0.275,
                   minWidth: Get.width*0.237,

                 ),renderBorder: false,
                 isSelected: [true,false,false],
                 children: [
                   Expanded(
                     child: GestureDetector(
                       onTap: (){
                         allEventsIndex=0;
                         allEventsController.jumpToPage(allEventsIndex);
                         setState(() {

                         });
                       },
                       child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(allEventsIndex==0?20:0),
                           color: allEventsIndex==0?AppColors.themeColor:AppColors.offWhite,
                         ),
                         child: Center(child: Text(getTranslated(context, "my_events")??"",style: AppTextStyle.montserrat(allEventsIndex==0?AppColors.whiteColor:AppColors.shadedBlack, Get.width*0.04, FontWeight.w400),)),
                       ),
                     ),
                   ),
                   Expanded(
                     child: GestureDetector(
                       onTap: (){
                         allEventsIndex=1;
                         allEventsController.jumpToPage(allEventsIndex);
                         setState(() {

                         });
                       },
                       child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(allEventsIndex==1?20:0),
                           color: allEventsIndex==1?AppColors.themeColor:AppColors.offWhite,
                         ),
                         child: Center(child: Text(getTranslated(context, 'joined')??"",style: AppTextStyle.montserrat(allEventsIndex==1?AppColors.whiteColor:AppColors.shadedBlack, Get.width*0.04, FontWeight.w400),)),
                       ),
                     ),
                   ),
                   Expanded(
                     child: GestureDetector(
                       onTap: (){
                         allEventsIndex=2;
                         allEventsController.jumpToPage(allEventsIndex);
                         setState(() {

                         });
                       },
                       child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(allEventsIndex==2?20:0),
                           color: allEventsIndex==2?AppColors.themeColor:AppColors.offWhite,
                         ),
                         child: Center(child: Text(getTranslated(context, "pending2")??"",style: AppTextStyle.montserrat(allEventsIndex==2?AppColors.whiteColor:AppColors.shadedBlack, Get.width*0.04, FontWeight.w400),)),
                       ),
                     ),
                   ),


                 ],
               ),
               Expanded(
                 child: PageView(
                   controller:allEventsController,
                   physics: const NeverScrollableScrollPhysics(),
                   onPageChanged: (value){
                     allEventsIndex = value;
                     setState(() {

                     });
                   },
                   children: [
                     SingleChildScrollView(
                       child: Column(
                         children: List.generate(provider.events.length, (index)=> GestureDetector( onTap: (){Get.to(EventDetails(index: allEventsIndex,));},
                             child: EventDescriptionWidget(model: provider.events[index], titleImage: false,))),
                       ),
                     ),
                     SingleChildScrollView(
                       child: Column(
                         children: List.generate(provider.events.length, (index)=> GestureDetector(  onTap: (){Get.to(EventDetails(index: allEventsIndex,));},
                             child: EventDescriptionWidget(model: provider.events[index], titleImage: false,))),
                       ),
                     ),
                     SingleChildScrollView(
                       child: Column(
                         children: List.generate(provider.events.length, (index)=> GestureDetector( onTap: (){Get.to(EventDetails(index: allEventsIndex,));},child: EventDescriptionWidget(model: provider.events[index],titleImage: false,))),
                       ),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         );
       });
  }
}
