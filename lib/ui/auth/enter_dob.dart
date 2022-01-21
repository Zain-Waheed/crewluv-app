import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/create_event.dart';
import 'package:amigos/ui/auth/select_gender.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:amigos/utils/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import 'complete_profile_screen.dart';

FocusNode focus = FocusNode();

class EnterDOB extends StatefulWidget {
  const EnterDOB({Key? key}) : super(key: key);

  @override
  _EnterDOBState createState() => _EnterDOBState();
}

class _EnterDOBState extends State<EnterDOB> {
  DateTime _dob = DateTime.now();
  bool dateIconColor = false;
  FocusNode focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, dashPro, _) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.width * 0.1,
                ),
                Text(
                  getTranslated(context, 'dob') ?? "",
                  style: AppTextStyle.montserrat(
                      AppColors.shadedBlack, Get.width * 0.06, FontWeight.w600),
                ),
                SizedBox(
                  height: Get.width * 0.05,
                ),
                Text(
                  getTranslated(context, 'age_available') ?? "",
                  style: AppTextStyle.montserrat(
                      AppColors.lightGrey, Get.width * 0.035, FontWeight.w400),
                ),
                SizedBox(height: Get.width * 0.2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    dateWidget(dashPro.dayController, "23", "day"),
                    SizedBox(
                      width: Get.width * 0.04,
                    ),
                    dateWidget(dashPro.monthController, "03", "month"),
                    SizedBox(
                      width: Get.width * 0.04,
                    ),
                    Column(
                      children: [
                        Text(
                          getTranslated(context, 'year') ?? "",
                          style: AppTextStyle.montserrat(
                            AppColors.shadedBlack,
                            Get.width * 0.045,
                            FontWeight.w400,
                          ),
                        ),
                        Container(
                          width: Get.width * 0.2,
                          margin: EdgeInsets.only(top: Get.height * 0.01),
                          child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                              LengthLimitingTextInputFormatter(4),
                            ],
                            focusNode: focus,
                            autofocus: true,
                            validator: (value) => FieldValidator.dateCheck(dashPro.yearController.text),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: dashPro.yearController,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 20),
                              fillColor: AppColors.offWhite,
                              hintText: getTranslated(Get.context, '1998'),
                              hintStyle: AppTextStyle.montserrat(
                                AppColors.greyText,
                                Get.width * 0.04,
                                FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: AppColors.borderShadow),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: AppColors.themeColor),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: AppColors.themeColor),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: AppColors.themeColor),
                              ),
                              filled: true,
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
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  dateWidget(
  controller,
    String hint,
    String text,
  ) {
    return Column(
      children: [
        Text(
          getTranslated(context, text) ?? "",
          style: AppTextStyle.montserrat(
            AppColors.shadedBlack,
            Get.width * 0.045,
            FontWeight.w400,
          ),
        ),
        Container(
          width: Get.width * 0.15,
          margin: EdgeInsets.only(top: Get.height * 0.01),
          child: TextFormField(
            textInputAction: TextInputAction.next,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              LengthLimitingTextInputFormatter(2),
            ],
            autofocus: true,
            // validator: (value) => FieldValidator.dateCheck(controller.text), autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              fillColor: AppColors.offWhite,
              hintText: getTranslated(Get.context, hint),
              hintStyle: AppTextStyle.montserrat(
                AppColors.greyText,
                Get.width * 0.04,
                FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: AppColors.borderShadow),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: AppColors.themeColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: AppColors.themeColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: AppColors.themeColor),
              ),
              filled: true,
            ),
          ),
        ),
      ],
    );
  }
}
