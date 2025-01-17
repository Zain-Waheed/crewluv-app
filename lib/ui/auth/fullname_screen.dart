import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/auth/complete_profile_screen.dart';
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

import '../../main.dart';

FocusNode focus = FocusNode();

class EnterFullName extends StatefulWidget {
  const EnterFullName({Key? key}) : super(key: key);

  @override
  _EnterFullNameState createState() => _EnterFullNameState();
}

class _EnterFullNameState extends State<EnterFullName> {

  FocusNode focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, dashPro, _) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
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
              focusNode: focus,
              validator: (value) => FieldValidator.validateName(
                  dashPro.fullNameController.text),
              onFieldSubmitted: (val) {
                dashPro.setFocus();
              },
              onTap: (){
                setState(() {

                });
              },
              onChanged: (val) {
                setState(() {
                  if (dashPro.formKey.currentState!.validate()) {
                    dashPro.formCheck[dashPro.pageIndex] = 1;
                  } else {
                    dashPro.formCheck[dashPro.pageIndex] = -1;
                  }
                  dashPro.fullNameController.text.removeAllWhitespace;
                });
                Get.forceAppUpdate();
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: dashPro.fullNameController,
              decoration: AppInputDecoration.circularFieldDecoration(
                null,
                'enter_name',
                Image.asset(
                  AppImages.fullNameIcon,
                  scale: 2.5,
                  color: focus.hasFocus
                      ? AppColors.themeColor
                      : AppColors.slateGrey,
                ),
              ),
            ),
            SizedBox(height: Get.width * 0.15),
          ],
        ),
      );
    });
  }
}
