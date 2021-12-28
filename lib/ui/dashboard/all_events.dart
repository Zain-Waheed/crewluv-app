import 'package:amigos/helpers/widgets/event_description_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class AllEvents extends StatefulWidget {
  const AllEvents({Key? key}) : super(key: key);

  @override
  _AllEventsState createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  int index=0;
  PageController controller = PageController();
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
               Container(
                 height: Get.width*0.09,
                 width: Get.width*0.9,
                 margin: EdgeInsets.symmetric(horizontal: Get.width*0.05),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     border: Border.all(color: AppColors.genderBorder),
                     color: AppColors.offWhite
                 ),
                 child: Row(
                   children: [
                     Expanded(
                       child: GestureDetector(
                         onTap: (){
                           index=0;
                           controller.jumpToPage(index);
                           setState(() {

                           });
                         },
                         child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: index==0?AppColors.themeColor:AppColors.offWhite,
                           ),
                           child: Center(child: Text(getTranslated(context, "my_events")??"",style: AppTextStyle.montserrat(index==0?AppColors.whiteColor:AppColors.shadedBlack, Get.width*0.035, FontWeight.w400),)),
                         ),
                       ),
                     ),
                     Expanded(
                       child: GestureDetector(
                         onTap: (){
                           index=1;
                           controller.jumpToPage(index);
                           setState(() {

                           });
                         },
                         child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: index==1?AppColors.themeColor:AppColors.offWhite,
                           ),
                           child: Center(child: Text(getTranslated(context, 'joined')??"",style: AppTextStyle.montserrat(index==1?AppColors.whiteColor:AppColors.shadedBlack, Get.width*0.035, FontWeight.w400),)),
                         ),
                       ),
                     ),
                     Expanded(
                       child: GestureDetector(
                         onTap: (){
                           index=2;
                           controller.jumpToPage(index);
                           setState(() {

                           });
                         },
                         child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: index==2?AppColors.themeColor:AppColors.offWhite,
                           ),
                           child: Center(child: Text(getTranslated(context, "pending2")??"",style: AppTextStyle.montserrat(index==2?AppColors.whiteColor:AppColors.shadedBlack, Get.width*0.035, FontWeight.w400),)),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
               Expanded(
                 child: PageView(
                   controller:controller,
                   physics: const NeverScrollableScrollPhysics(),
                   onPageChanged: (value){
                     index = value;
                     setState(() {

                     });
                   },
                   children: [
                     Column(
                       children: List.generate(provider.events.length, (index)=> EventDescriptionWidget(model: provider.events[index], titleImage: false,)),
                     ),
                     Column(
                       children: List.generate(provider.events.length, (index)=> EventDescriptionWidget(model: provider.events[index], titleImage: false,)),
                     ),
                     Column(
                       children: List.generate(provider.events.length, (index)=> EventDescriptionWidget(model: provider.events[index],titleImage: false,)),
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
