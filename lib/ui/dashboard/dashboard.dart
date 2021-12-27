import 'package:amigos/ui/dashboard/all_events.dart';
import 'package:amigos/ui/dashboard/my_events.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 class DashBoardScreen extends StatefulWidget {
   const DashBoardScreen({Key? key}) : super(key: key);

   @override
   _DashBoardScreenState createState() => _DashBoardScreenState();
 }

 class _DashBoardScreenState extends State<DashBoardScreen> {
   PageController controller = PageController();
   int pageIndex=0;
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: PageView(
         controller: controller,
         onPageChanged: (value){
           pageIndex=value;
         },
         children: const [
           MyEvents(),
           AllEvents(),
         ],
       ),

       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       floatingActionButton: FloatingActionButton(
         child:  Center(child: Image.asset(AppImages.addEvent,scale: 3,color: AppColors.whiteColor,)),
         backgroundColor: AppColors.themeColor,

         elevation: 2.0,
         onPressed: (){},
       ),
       bottomNavigationBar: BottomAppBar(
         clipBehavior: Clip.antiAlias,
         child: Container(
           height: Get.width*0.15,
           padding: EdgeInsets.all(Get.width*0.01),
           decoration:  BoxDecoration(
             boxShadow: [
               BoxShadow(
                   color: AppColors.black.withOpacity(0.9), offset: const Offset(0, 4), blurRadius: 2.0)
             ],
             borderRadius:  const BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20),),
             color: AppColors.whiteColor,
           ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Image.asset(AppImages.home,scale: 3,),
               GestureDetector(
                 onTap: (){
                   pageIndex=1;
                   controller.jumpToPage(pageIndex);
                   setState(() {

                   });

                 },
                 child: Image.asset(AppImages.people,scale: 3,),

               ),
               Image.asset(AppImages.chat2,scale: 3,),
               Image.asset(AppImages.user,scale: 3,),

             ],
           ),
         ),
         shape: const CircularNotchedRectangle(),
         elevation: 10,
         notchMargin: 5,
       ),
     );
   }
 }
