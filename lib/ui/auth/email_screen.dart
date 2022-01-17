import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:amigos/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  FocusNode focus= FocusNode();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context,dashPro,_){
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.width * 0.1,
                ),
                Text(
                  getTranslated(context, 'enter_email_address') ?? "",
                  style: AppTextStyle.montserrat(
                      AppColors.shadedBlack, Get.width * 0.06, FontWeight.w600),
                ),
                SizedBox(
                  height: Get.width * 0.05,
                ),
                Text(
                  getTranslated(context, 'confirm_email') ?? "",
                  style: AppTextStyle.montserrat(
                      AppColors.lightGrey, Get.width * 0.035, FontWeight.w400),
                ),
                SizedBox(height: Get.width * 0.15),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: dashPro.emailController,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: focus,
                  onTap: (){
                    setState(() {

                    });
                  },
                  onChanged: (val) {
                    if(dashPro.formKey.currentState!.validate() && isChecked==true){
                      dashPro.formCheck[dashPro.pageIndex] = 1;
                      dashPro.update();
                      setState(() {

                      });

                    }
                    else{
                      dashPro.formCheck[dashPro.pageIndex] = -1;
                      dashPro.update();
                      setState(() {

                      });

                    }
                    setState(() {

                    });
                  },

                  validator: (value) =>
                      FieldValidator.validateEmail(dashPro.emailController.text),
                  decoration: AppInputDecoration.circularFieldDecoration(
                    null,
                    'enter_email',
                    Image.asset(
                      AppImages.emailIcon,
                      color:
                      focus.hasFocus ? AppColors.themeColor : AppColors.slateGrey,
                    ),
                  ),
                ),
                SizedBox(height: Get.width * 0.15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: isChecked,
                      activeColor: AppColors.themeColor,
                      onChanged: (value) {
                        if(value==true && dashPro.formKey.currentState!.validate()){
                          dashPro.formCheck[dashPro.pageIndex] = 1;
                          dashPro.update();
                          setState(() {

                          });
                        }else
                        {
                          dashPro.formCheck[dashPro.pageIndex] = -1;
                          dashPro.update();
                          setState(() {

                          });
                        }
                        isChecked = value!;
                        setState(() {});
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Expanded(
                        child: Text(
                          getTranslated(context, "like_to_update") ?? "",
                          style: AppTextStyle.montserrat(
                              AppColors.lightGrey, Get.width * 0.027, FontWeight.w400),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },);

  }
}
