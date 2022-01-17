import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/models/notification_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {


  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override

  void initState() {
    var model = Provider.of<DashboardProvider>(context,listen: false);
    for(int i=0;i<model.notifications.length;i++)
      {
        model.notifications[i].isSeen=true;

      }
    model.update();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Consumer<DashboardProvider>(builder: (context,provider,_){
      return Scaffold(
        backgroundColor: AppColors.whiteBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Get.width*0.17),
          child: CustomAppBar(
            backButton: true,
            function: (){    Get.forceAppUpdate();
            Get.back();},
            title: 'notifications',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(provider.notifications.length, (index) => notificationWidget(provider.notifications[index])),

          ),
        ),

      );
    },);

  }
  Widget notificationWidget(NotificationModel model){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical: Get.width*0.015),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
          boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.2),offset: const Offset(0,1),blurRadius: 2.0
          )
        ]

      ),

      child: ListTile(
        leading: Container(
          child: Image.asset(model.image),
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            border:Border.all(width: 2,color: AppColors.redColor),
            shape: BoxShape.circle,
          ),
        ),
        title: Row(
          children: [
            Text(model.name,style: AppTextStyle.montserrat(AppColors.greyDark, Get.width*0.04, FontWeight.w500),),
            Text(model.age.toString(),style: AppTextStyle.montserrat(AppColors.greyDark, Get.width*0.04, FontWeight.w500),),
            Spacer(),
             Row(
                mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text(model.time,style: AppTextStyle.montserrat(AppColors.greyDark, Get.width*0.03, FontWeight.w400),),
               ],
             )
          ],
        ),
        subtitle: Text(model.description,maxLines: 2,overflow:TextOverflow.ellipsis ,),
        minVerticalPadding: 20,
       contentPadding: EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical: Get.width*0.02),
      ),
    );
  }
}
