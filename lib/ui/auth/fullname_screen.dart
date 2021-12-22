import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/ui/auth/enter_dob.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:amigos/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.width * 0.17),
        child: CustomAppBar(
            function: () {
              Get.back();
            },
            backButton: true,
            title: 'complete_profile'),
      ),
      bottomNavigationBar: Container(
        height: Get.width * 0.2,
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.07, vertical: Get.width * 0.03),
        child: AppButton(
          isWhite: false,
          width: Get.width * 0.6,
          buttonText: 'further',
          onpressed: () {
            if(formKey.currentState!.validate())
            {
              Get.to(() => const EnterDOB());
            }

          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.width * 0.1,
              ),

              Row(
                children: [
                  Expanded(
                    child: LinearPercentIndicator(
                      fillColor: AppColors.grey,
                      percent: 0.2,
                      lineHeight: Get.width*0.04,
                      linearGradient: AppColors.buttonGradientColor,

                    ),
                  ),
                  SizedBox(width: Get.width*0.01,),
                  Text('20%',style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.04, FontWeight.w300),)
                ],

              ),
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
              Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    validator: (value)=> FieldValidator.validateName(fullNameController.text),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: fullNameController,
                    decoration: AppInputDecoration.circularFieldDecoration(null, 'enter_name', Image.asset(AppImages.fullNameIcon,),),
                  )
              ),
              SizedBox(height: Get.width * 0.15),



            ],
          ),
        ),
      ),
    );
  }
}
