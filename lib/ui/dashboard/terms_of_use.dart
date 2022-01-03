import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TermsOfUse extends StatefulWidget {

  bool termsOfUse;
  TermsOfUse({required this.termsOfUse});

  @override
  _TermsOfUseState createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.width*0.17),
        child: CustomAppBar(
          function: (){ Get.back();},
          backButton: true,
          title: 'terms_of_use',

        ),

      ),
      body: Container(
        height: Get.height*0.7,
        margin: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.width*0.05),
        padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.width*0.05),
        decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: AppColors.opacBlack,blurRadius: 5,offset: const Offset(0,2)),

        ],

      ),
        child: SingleChildScrollView(child: Text(AppDummyData.longText,style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.035, FontWeight.w400),)),
      ),
    );
  }
}
