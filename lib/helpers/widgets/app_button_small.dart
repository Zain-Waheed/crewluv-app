import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/PreferenceModel.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AppButtonSmall extends StatefulWidget {
  final PreferenceModel preference;
  const AppButtonSmall({Key? key,  required this.preference,}) : super(key: key);

  @override
  _AppButtonSmallState createState() => _AppButtonSmallState();
}

class _AppButtonSmallState extends State<AppButtonSmall> {
  int index=0;
  bool value=false;
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder:(context,dashPro,_) {
     return GestureDetector(
        onTap: (){
          if(dashPro.pageIndex==5)
            {
              index= dashPro.favoriteDrinks.indexOf(widget.preference);
              value =dashPro.favoriteDrinks[index].isSelected!;
              dashPro.favoriteDrinks[index].isSelected = !value ;
              setState(() {

              });
              if(dashPro.favoriteDrinks.where((element) => element.isSelected == true).isEmpty){
                dashPro.formCheck[dashPro.pageIndex]=-1;


                setState(() {

                });
                Get.forceAppUpdate();
              }else{
                dashPro.formCheck[dashPro.pageIndex]=1;
                Get.forceAppUpdate();
              }
              setState(() {
              });
            }else
          if(dashPro.pageIndex==6)
          {
            index= dashPro.musictaste.indexOf(widget.preference);
            value =dashPro.musictaste[index].isSelected!;
            dashPro.musictaste[index].isSelected = !value ;
            if(dashPro.musictaste.where((element) => element.isSelected == true).isEmpty){
              dashPro.formCheck[dashPro.pageIndex]=-1;
              Get.forceAppUpdate();
            }else{
              dashPro.formCheck[dashPro.pageIndex]=1;
              Get.forceAppUpdate();
            }
            setState(() {
            });
          }
          else
          if(dashPro.pageIndex==7)
          {
            index= dashPro.interests.indexOf(widget.preference);
            value =dashPro.interests[index].isSelected!;
            dashPro.interests[index].isSelected = !value ;
            if(dashPro.interests.where((element) => element.isSelected == true).isEmpty){
              dashPro.formCheck[dashPro.pageIndex]=-1;
              Get.forceAppUpdate();
            }else{
              dashPro.formCheck[dashPro.pageIndex]=1;
              Get.forceAppUpdate();
            }
            setState(() {
            });
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: Get.width*0.03,horizontal: Get.width*0.05),
          margin: EdgeInsets.only(right: Get.width*0.025,top:Get.width*0.03 ),
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withOpacity(0.2), offset: const Offset(0, 4), blurRadius: 5.0)
            ],
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: widget.preference!.isSelected==true?AppColors.themeColor:AppColors.offWhite,
            ),
          ),
          child: Text(
            getTranslated(context, widget.preference!.name ?? "")??"",
            style: AppTextStyle.montserrat(widget.preference!.isSelected==true?AppColors.themeColor:AppColors.blackLite, Get.width*0.04, FontWeight.w400),
          ),
        ),
      );
    }
    );
  }
}
