import 'package:amigos/helpers/bottom_sheets/delete_profile.dart';
import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/auth/login_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class LogoutBottomSheet extends StatefulWidget {
  const LogoutBottomSheet({Key? key}) : super(key: key);

  @override
  _LogoutBottomSheetState createState() => _LogoutBottomSheetState();
}

class _LogoutBottomSheetState extends State<LogoutBottomSheet> {
  bool dontLike =false;
  bool spendingMuchTime= false;
  bool  cantTell = false;
  bool temporary = false;

  @override
  Widget build(BuildContext context) {
    return
    Consumer<DashboardProvider>(builder: (context,dashPro,_){
      return Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.logout2,height: Get.height*0.12,width: Get.width*0.4,),
            SizedBox(height: Get.height*0.03,),
            Text(getTranslated(context, 'what_went_wrong')??'',style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.035, FontWeight.w500),),
            SizedBox(height: Get.height*0.012,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.001),
              margin: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.007),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor,
                  boxShadow:[
                    BoxShadow(
                        color: AppColors.opacBlack.withOpacity(0.1),
                        offset: const Offset(0,20),
                        blurRadius: 5


                    )
                  ]
              ),
              child: Row(
                children: [
                  Text(getTranslated(context, "don't_like")??''),
                  Spacer(),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: AppColors.themeColor),
                    child: Checkbox(
                      value: dontLike,
                      activeColor: AppColors.themeColor,
                      onChanged: (value) {
                        dontLike = value!;
                        if(dontLike==true)
                        {
                          cantTell=false;
                          temporary=false;
                          spendingMuchTime =false;

                        }
                        setState(() {});
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),


                ],
              ),

            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.001),
              margin: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.007),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor,
                  boxShadow:[
                    BoxShadow(
                        color: AppColors.opacBlack.withOpacity(0.1),
                        offset: const Offset(0,20),
                        blurRadius: 5


                    )
                  ]
              ),
              child: Row(
                children: [
                  Text(getTranslated(context, "spending_much_time")??''),
                  Spacer(),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: AppColors.themeColor),
                    child: Checkbox(
                      value: spendingMuchTime,
                      activeColor: AppColors.themeColor,
                      onChanged: (value) {
                        spendingMuchTime = value!;
                        if(spendingMuchTime==true)
                        {
                          cantTell=false;
                          temporary=false;
                          dontLike =false;

                        }
                        setState(() {});
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),

            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.001),
              margin: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.007),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor,
                  boxShadow:[
                    BoxShadow(
                        color: AppColors.opacBlack.withOpacity(0.1),
                        offset: const Offset(0,20),
                        blurRadius: 5


                    )
                  ]
              ),
              child: Row(
                children: [
                  Text(getTranslated(context, "can't_tell")??''),
                  Spacer(),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: AppColors.themeColor),
                    child: Checkbox(
                      value: cantTell,
                      activeColor: AppColors.themeColor,
                      onChanged: (value) {
                        cantTell = value!;
                        if(cantTell==true)
                        {
                          temporary=false;
                          dontLike=false;
                          spendingMuchTime =false;

                        }
                        setState(() {});
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),


                ],
              ),

            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.001),
              margin: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.007),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor,
                  boxShadow:[
                    BoxShadow(
                        color: AppColors.opacBlack.withOpacity(0.1),
                        offset: const Offset(0,4),
                        blurRadius: 2


                    )
                  ]
              ),
              child: Row(
                children: [
                  Text(getTranslated(context, "temporary_logout")??''),
                  Spacer(),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: AppColors.themeColor),
                    child: Checkbox(
                      value: temporary,
                      activeColor: AppColors.themeColor,
                      onChanged: (value) {
                        temporary = value!;
                        if(temporary==true)
                        {
                          cantTell=false;
                          dontLike=false;
                          spendingMuchTime =false;

                        }
                        setState(() {});
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),


                ],
              ),

            ),
            SizedBox(height: Get.height*0.015,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(buttonText: 'no',
                    onpressed: (){
                      Get.back();
                    },
                    width: Get.width*0.35, isWhite: true),
                AppButton(buttonText: 'next',
                    onpressed: (){
                      if(temporary == true || cantTell ==true||spendingMuchTime==true||dontLike==true)
                      {
                        if(temporary == true || cantTell ==true){
                          Get.to(()=> const Login());
                          dashPro.onLogout();
                        }else
                        if(spendingMuchTime==true||dontLike==true){
                          Get.bottomSheet(const DeleteProfile(),isScrollControlled: true,);
                        }
                      }
                      else
                      {
                        Fluttertoast.showToast(
                          msg: getTranslated(context, 'first_mark_the_check')??"",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                        );
                        // Get.bottomSheet(const DeleteProfile(),isScrollControlled: true,);

                      }

                    }, width: Get.width*0.35, isWhite: false)

              ],
            ),
            SizedBox(height: Get.height*0.03,),
          ],

        ),
      );
    });
  }
}
