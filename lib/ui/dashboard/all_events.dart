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

 List<bool> selected=[true,false,false];
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
                 decoration: BoxDecoration(
                   border: Border.all(color: AppColors.genderBorder),
                   borderRadius: BorderRadius.circular(20),
                 ),
                 child: ToggleButtons(
                   borderRadius: BorderRadius.circular(30),
                   borderColor: AppColors.black,
                   fillColor: Colors.transparent,
                   constraints: BoxConstraints(
                     maxHeight: Get.height*0.05,
                     minHeight: Get.height*0.05,
                     maxWidth: Get.width*0.275,
                     minWidth: Get.width*0.237,

                   ),renderBorder: false,
                   onPressed: (x){

                     if(x==0){
                       provider.allEventPageIndex=0;
                       provider.update();
                       selected[0]=true;
                       selected[1]=selected[2]=false;

                     }
                     else if(x==1){
                       provider.allEventPageIndex=1;
                       provider.update();
                       selected[1]=true;
                       selected[0]=selected[2]=false;

                     }
                     else{
                       provider.allEventPageIndex=2;
                       provider.update();
                       selected[2]=true;
                       selected[1]=selected[0]=false;

                     }

                   },
                   isSelected: selected,
                   children:
                   [
                     tabs( 'my_events',selected[0]),
                     tabs( 'joined',selected[1]),
                     tabs( 'pending2',selected[2]),

                   ],
                 ),
               ),
               Expanded(
                 child: Padding(
                   padding: EdgeInsets.only(bottom: Get.height*0.1),
                   child: IndexedStack(
                     index: provider.allEventPageIndex,
                     children: [
                       SingleChildScrollView(
                         child: Column(
                           children: List.generate(provider.events.length, (index)=> GestureDetector( onTap: (){
                             Get.to(EventDetails(index: 0,));},
                               child: EventDescriptionWidget(model: provider.events[index], titleImage: false,))),
                         ),
                       ),
                       SingleChildScrollView(
                         child: Column(
                           children: List.generate(provider.events.length, (index)=> GestureDetector(  onTap: (){
                             Get.to(EventDetails(index: 1,));},
                               child: EventDescriptionWidget(model: provider.events[index], titleImage: false,))),
                         ),
                       ),
                       SingleChildScrollView(
                         child: Column(
                           children: List.generate(provider.events.length, (index)=> GestureDetector( onTap: (){
                             Get.to(EventDetails(index: 2,));},child: EventDescriptionWidget(model: provider.events[index],titleImage: false,))),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             ],
           ),
         );
       });
  }
  Widget tabs(String? text,bool selected){
    return   Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(selected?20:0),
        color: selected?AppColors.themeColor:AppColors.offWhite,
      ),
      child: Center(child: Text(getTranslated(context, text??'')??"",style: AppTextStyle.montserrat(selected?AppColors.whiteColor:AppColors.shadedBlack, Get.width*0.04, FontWeight.w400),)),
    );
  }
}
