import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:amigos/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class University extends StatefulWidget {
  const University({Key? key}) : super(key: key);

  @override
  _UniversityState createState() => _UniversityState();
}

class _UniversityState extends State<University> {

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context,dashPro,_){
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.width * 0.1,
          ),
          Text(
            getTranslated(context, 'university') ?? "",
            style: AppTextStyle.montserrat(
                AppColors.shadedBlack, Get.width * 0.06, FontWeight.w600),
          ),
          SizedBox(
            height: Get.width * 0.05,
          ),
          Text(
            getTranslated(context, 'your_university_will') ?? "",
            style: AppTextStyle.montserrat(
                AppColors.lightGrey, Get.width * 0.035, FontWeight.w400),
          ),
          SizedBox(height: Get.width * 0.15),
          TextFormField(
            validator: (value)=> FieldValidator.validateName(
                dashPro.universityController.text
            ),
            // onChanged: (val)
            // {
            //
            //   setState(() {
            //     if(dashPro.formKey.currentState!.validate())
            //     {
            //       dashPro.formCheck[dashPro.pageIndex]=1;
            //     }
            //     else
            //     {
            //       dashPro.formCheck[dashPro.pageIndex]=-1;
            //     }
            //   });
            //   Get.forceAppUpdate();
            // },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: dashPro.universityController,
            decoration: AppInputDecoration.circularFieldDecoration(null, 'university', null,),
          ),
          SizedBox(height: Get.width * 0.05),
          TextFormField(
            validator: (value)=> FieldValidator.validateName(
                dashPro.cityController.text
            ),
            onChanged: (val)
            {

              setState(() {
                if(dashPro.formKey.currentState!.validate())
                {
                  dashPro.formCheck[dashPro.pageIndex]=1;
                }
                else
                {
                  dashPro.formCheck[dashPro.pageIndex]=-1;
                }
              });
              Get.forceAppUpdate();
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: dashPro.cityController,
            decoration: AppInputDecoration.circularFieldDecoration(null, 'city', null,),),
          SizedBox(height: Get.width * 0.15),



        ],
      ),
    );
    },);
  }
}
