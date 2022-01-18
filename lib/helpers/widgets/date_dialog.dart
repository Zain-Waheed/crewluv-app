import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/auth/complete_profile_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


class DateDialogBox extends StatefulWidget {
  const DateDialogBox({Key? key}) : super(key: key);

  @override
  _DateDialogBoxState createState() => _DateDialogBoxState();
}

class _DateDialogBoxState extends State<DateDialogBox> {
  @override
  Widget build(BuildContext context) {
    return
    Consumer<DashboardProvider>(builder: (context,provider,_){
      return GestureDetector(
        onTap: (){
          Navigator.of(context).pop();
        },
        child: Scaffold(
          backgroundColor: AppColors.black.withOpacity(0.4),
          body: Center(
            child: Container(
              width: Get.width*0.9,
              padding: EdgeInsets.symmetric(vertical: Get.height*0.03),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.width*0.05,
                    ),
                    Text(getTranslated(context, 'are_you_sure')??"",
                      style: AppTextStyle.montserrat(
                        AppColors.shadedBlack,
                        Get.width*0.05,
                        FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.03,
                    ),
                    Text(getTranslated(context, 'you_have_entered')??"",
                      style: AppTextStyle.montserrat(
                        AppColors.blackLite,
                        Get.width*0.04,
                        FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: Get.width*0.08,
                    ),
                    AppButton(buttonText: 'further', onpressed:(){
                      Get.back(result: true);
                      },
                        width: Get.width * 0.85,
                        isWhite: false),
                    TextButton(
                      onPressed: () {
                        Get.back(result: false);
                      },
                      child: Text(
                        getTranslated(context, 'no') ?? "",
                        style: AppTextStyle.montserrat(AppColors.blackLite,
                            Get.width * 0.04, FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: Get.width * 0.04,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
