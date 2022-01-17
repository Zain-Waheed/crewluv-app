import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/app_button_grey.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/auth_provider.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/auth/complete_profile_screen.dart';
import 'package:amigos/ui/auth/login_screen.dart';
import 'package:amigos/ui/auth/otp_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';




FocusNode focus = FocusNode();
class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String initialCountry = 'PK';
  bool validated=false;
  FocusNode focus = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder:(context,provider,_){
      return   GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          setState(() {

          });
        },
        child: Scaffold(
          appBar:PreferredSize(preferredSize: Size.fromHeight(Get.width*0.17),
              child: CustomAppBar(backButton: true,function: (){Get.to(Login());},title: '',)
          ),
          bottomNavigationBar: Container(
            height: Get.width*0.2,
            margin: EdgeInsets.only(left: Get.width * 0.07,right:Get.width * 0.07,bottom: Get.width*0.03),
            padding: EdgeInsets.only(bottom: Get.height*0.03),
            child:  validated==false?AppButtonGrey("request_otp"):AppButton(isWhite: false,width: Get.width*0.6,buttonText: 'request_otp',
              onpressed: (){
                if(formKey.currentState!.validate())
                {
                  provider.phone=phoneController.text;
                  Get.to(() => const OtpScreen());
                }
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: Get.width*0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.width*0.1,),
                  Text(getTranslated(context, 'enter_your_number')??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.07, FontWeight.w600),),
                  SizedBox(height: Get.width*0.03,),
                  Text(getTranslated(context, 'welcome_to')??"",style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.035, FontWeight.w400),),
                  SizedBox(height: Get.width*0.2,),
                  Stack(
                    children: [
                      Container(
                        height: Get.width * 0.16,
                        width: Get.width*0.9,
                        margin: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: focus.hasFocus?AppColors.themeColor:AppColors.greyText),
                            borderRadius: BorderRadius.circular(30)),

                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: Get.width * 0.16,
                          width: Get.width*0.003,
                          color: focus.hasFocus?AppColors.themeColor:AppColors.greyText,
                          margin: EdgeInsets.only(right: Get.width*0.3),

                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,top: 5,right: 10),
                        child: Form(
                          key: formKey,
                          child: InternationalPhoneNumberInput(
                            focusNode: focus,
                            key: Key('phone_number'),
                            inputDecoration: InputDecoration(
                              hintText: "746 8373 829",
                              suffixIcon: validated==true?Container(
                                margin: EdgeInsets.only(right: Get.width*0.03),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.green
                                ),
                                child: Center(
                                  child: Image.asset(AppImages.tick,scale: 2,),
                                ),
                              ):SizedBox(),
                              suffixIconConstraints: BoxConstraints(
                                maxHeight: Get.width*0.05,
                                maxWidth: Get.width*0.1,
                              ),
                              hintStyle: AppTextStyle.montserrat(AppColors.greyText, Get.width*0.04, FontWeight.w500),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(color:Colors.transparent),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(color:Colors.transparent),
                              ),
                              isDense: true,
                            ),
                            inputBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.themeColor,style: BorderStyle.solid)
                            ),
                            onInputChanged: (number) {
                              setState(() {

                              });
                            },
                            onInputValidated: (bool value) {
                              validated=value;
                              setState(() {

                              });
                            },
                            selectorConfig: SelectorConfig(
                              leadingPadding: 2,
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                              showFlags: true,
                            ),
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.onUserInteraction,
                            selectorTextStyle: AppTextStyle.montserrat(AppColors.greyText, Get.width*0.04, FontWeight.w500),
                            textFieldController: phoneController,
                            countrySelectorScrollControlled: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.width*0.1,),
                  Text(AppDummyData.mediumText,style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.032, FontWeight.w500),)

                ],
              ),
            ),
          ),

        ),
      );

    });
  }
}
