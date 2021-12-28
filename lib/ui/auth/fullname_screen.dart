import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/auth/enter_dob.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:amigos/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
class EnterFullName extends StatefulWidget {
  const EnterFullName({Key? key}) : super(key: key);

  @override
  _EnterFullNameState createState() => _EnterFullNameState();
}

class _EnterFullNameState extends State<EnterFullName> {
  TextEditingController fullNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context,dashPro,_){
      return Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(Get.width * 0.17),
        //   child: CustomAppBar(
        //       function: () {
        //         Get.back();
        //       },
        //       backButton: true,
        //       title: 'complete_profile'),
        // ),
        // bottomNavigationBar: Container(
        //   height: Get.width * 0.2,
        //   padding: EdgeInsets.symmetric(
        //       horizontal: Get.width * 0.07, vertical: Get.width * 0.03),
        //   child: AppButton(
        //     isWhite: false,
        //     width: Get.width * 0.6,
        //     buttonText: 'further',
        //     onpressed: () {
        //       if(formKey.currentState!.validate())
        //       {
        //         Get.to(() => const EnterDOB());
        //       }
        //
        //     },
        //   ),
        // ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.width * 0.1,
            ),
            Text(
              getTranslated(context, 'enter_full_name') ?? "",
              style: AppTextStyle.montserrat(
                  AppColors.shadedBlack, Get.width * 0.06, FontWeight.w600),
            ),
            SizedBox(
              height: Get.width * 0.05,
            ),
            Text(
              getTranslated(context, 'name_description') ?? "",
              style: AppTextStyle.montserrat(
                  AppColors.lightGrey, Get.width * 0.035, FontWeight.w400),
            ),
            SizedBox(height: Get.width * 0.15),
            TextFormField(
              validator: (value)=> FieldValidator.validateName(fullNameController.text),
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
              controller: fullNameController,
              decoration: AppInputDecoration.circularFieldDecoration(null, 'enter_name', Image.asset(AppImages.fullNameIcon,),),
            ),
            SizedBox(height: Get.width * 0.15),



          ],
        ),
      );
    });
  }
}
