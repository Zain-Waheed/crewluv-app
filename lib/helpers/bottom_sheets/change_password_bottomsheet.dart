import 'package:amigos/helpers/bottom_sheets/congratulation_bottomsheet.dart';
import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:amigos/utils/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController passwordController=new TextEditingController();
  final TextEditingController newPasswordController=new TextEditingController();
  final TextEditingController confirmPasswordController=new TextEditingController();
  bool isShowPass = true;
  bool isShowPassNew = true;
  bool isShowPassConfirm = true;
  int isActive=-1;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, dashPro, _) {
      return GestureDetector(
        onTap: (){
          isActive=-1;
          setState(() {

          });
          FocusScope.of(context).requestFocus(new FocusNode());

        },
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: Get.width * 0.002, horizontal: Get.width * 0.03),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: AppColors.whiteColor,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: Get.width * 0.25,
                    padding: EdgeInsets.symmetric(vertical: Get.width * 0.008),
                    margin: EdgeInsets.symmetric(vertical: Get.width * 0.03),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.bottomSheetGrey),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Center(
                    child: Image.asset(
                  AppImages.newPassword,
                  scale: 3,
                )),
                SizedBox(
                  height: Get.height * 0.002,
                ),
                Center(
                    child: Text(
                  getTranslated(context, "change_password") ?? "",
                  style: AppTextStyle.montserrat(
                      AppColors.black, Get.width * 0.04, FontWeight.w700),
                )),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Center(
                  child: Text(
                    getTranslated(context, "must_include") ?? "",
                    style: AppTextStyle.montserrat(
                        AppColors.shadedBlack, Get.width * 0.04, FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Form(
                  key: formKey,
                    child: Padding(
                      padding:EdgeInsets.symmetric(horizontal: Get.width*0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTranslated(context, "old_password") ?? "",
                            style: AppTextStyle.montserrat(
                                AppColors.shadedBlack, Get.width * 0.035, FontWeight.w500),
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: passwordController,
                              validator: (value)=>FieldValidator.validatePasswordSignup(passwordController.text),
                              obscureText: !isShowPass,
                              decoration: AppInputDecoration.lessCircularDecoration(
                                null,
                                'enter_password',
                                IconButton(
                                  icon: isShowPass?Image.asset(AppImages.eye,color: isActive==0?AppColors.themeColor:null,height: Get.height*0.04,width: Get.width*0.06,):Image.asset(AppImages.private,color: isActive==0?AppColors.themeColor:AppColors.slateGrey,height:Get.height*0.04,width: Get.width*0.06,),
                                  onPressed: () {
                                    setState(() {
                                      isShowPass =
                                      !isShowPass;
                                    });
                                  },
                                ),
                                AppColors.silverWhite
                            ),
                            onTap:(){
                              setState(() {
                                isActive=0;
                              });
                            }
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Text(
                            getTranslated(context, "new_password") ?? "",
                            style: AppTextStyle.montserrat(
                                AppColors.shadedBlack, Get.width * 0.035, FontWeight.w500),
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: newPasswordController,
                            validator: (value)=>FieldValidator.validatePasswordSignup(newPasswordController.text),
                            obscureText: !isShowPassNew,
                            decoration: AppInputDecoration.lessCircularDecoration(
                                null,
                                'enter_password',
                                IconButton(
                                  icon: isShowPassNew?Image.asset(AppImages.eye,color: isActive==1?AppColors.themeColor:AppColors.slateGrey,height: Get.height*0.04,width: Get.width*0.06,):Image.asset(AppImages.private,color: isActive==1?AppColors.themeColor:AppColors.slateGrey,height: Get.height*0.04,width: Get.width*0.06,),
                                  onPressed: () {
                                    setState(() {
                                      isShowPassNew =
                                      !isShowPassNew;
                                    });
                                  },
                                ),
                                AppColors.silverWhite),
                              onTap:(){
                                setState(() {
                                  isActive=1;
                                });
                              }

                          ),
                          SizedBox(height: Get.height * 0.02),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: confirmPasswordController,
                            validator: (value)=>FieldValidator.validateNumber(confirmPasswordController.text),
                            obscureText: !isShowPassConfirm,
                            decoration: AppInputDecoration.lessCircularDecoration(
                                null,
                                'confirm_password',
                                IconButton(
                                  icon: isShowPassConfirm?Image.asset(AppImages.eye,color: isActive==2?AppColors.themeColor:AppColors.slateGrey,height: Get.height*0.04,width: Get.width*0.06,):Image.asset(AppImages.private,color: isActive==2?AppColors.themeColor:AppColors.slateGrey,height: Get.height*0.04,width: Get.width*0.06,),
                                  onPressed: () {
                                    setState(() {
                                      isShowPassConfirm =
                                      !isShowPassConfirm;
                                    });
                                  },
                                ),
                                AppColors.silverWhite),
                              onTap:(){
                                setState(() {
                                  isActive=2;
                                });
                              }
                          ),
                        ],
                      ),
                    )
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Center(
                    child: AppButton(
                        buttonText: 'save_changes',
                        onpressed: () {

                          if( formKey.currentState!.validate())
                            {
                              Get.back();
                              Get.bottomSheet(
                                  const CongraulationBottomSheet(text: 'your_password_has',)
                              );
                              Future.delayed(Duration(seconds: 3),(){
                                Get.back();
                              });

                            }
                        },
                        width: Get.width * 0.9,
                        isWhite: false)),
                SizedBox(
                  height: Get.height * 0.02,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
