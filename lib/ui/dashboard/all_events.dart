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
                   GestureDetector(
                     onTap: (){
                       provider.allEventPageIndex=0;
                       provider.update();

                     },
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(provider.allEventPageIndex==0?20:0),
                         color: provider.allEventPageIndex==0?AppColors.themeColor:AppColors.offWhite,
                       ),
                       child: Center(child: Text(getTranslated(context, "my_events")??"",style: AppTextStyle.montserrat(provider.allEventPageIndex==0?AppColors.whiteColor:AppColors.shadedBlack, Get.width*0.04, FontWeight.w400),)),
                     ),
                   ),
                   GestureDetector(
                     onTap: (){
                       provider.allEventPageIndex=1;
                       provider.update();
                     },
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(provider.allEventPageIndex==1?20:0),
                         color: provider.allEventPageIndex==1?AppColors.themeColor:AppColors.offWhite,
                       ),
                       child: Center(child: Text(getTranslated(context, 'joined')??"",style: AppTextStyle.montserrat(provider.allEventPageIndex==1?AppColors.whiteColor:AppColors.shadedBlack, Get.width*0.04, FontWeight.w400),)),
                     ),
                   ),
                   GestureDetector(
                     onTap: (){
                       provider.allEventPageIndex=2;
                       provider.update();
                     },
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(provider.allEventPageIndex==2?20:0),
                         color: provider.allEventPageIndex==2?AppColors.themeColor:AppColors.offWhite,
                       ),
                       child: Center(child: Text(getTranslated(context, "pending2")??"",style: AppTextStyle.montserrat(provider.allEventPageIndex==2?AppColors.whiteColor:AppColors.shadedBlack, Get.width*0.04, FontWeight.w400),)),
                     ),
                   ),


                 ],
               ),
               Expanded(
                 child: IndexedStack(
                   index: provider.allEventPageIndex,
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
