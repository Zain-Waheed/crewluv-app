import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/app_button_grey.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/ui/auth/otp_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/dummy.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
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

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar:PreferredSize(preferredSize: Size.fromHeight(Get.width*0.17),
      child: CustomAppBar(backButton: true,function: (){},title: '',)
      ),
      bottomNavigationBar: Container(
        height: Get.width*0.2,
        padding: EdgeInsets.symmetric(horizontal: Get.width*0.07,vertical: Get.width*0.03),
        child:  validated==false?AppButtonGrey():AppButton(isWhite: false,width: Get.width*0.6,buttonText: 'request_otp',
          onpressed: (){
            if(formKey.currentState!.validate())
              {
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
              SizedBox(height: Get.width*0.2,),
              Text(getTranslated(context, 'enter_your_number')??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.07, FontWeight.w600),),
              SizedBox(height: Get.width*0.03,),
              Text(getTranslated(context, 'welcome_to')??"",style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.035, FontWeight.w400),),
              SizedBox(height: Get.width*0.2,),
              Form(
                key: formKey,
                child: InternationalPhoneNumberInput(
                  key: Key('phone_number'),
                  inputDecoration: InputDecoration(
                    fillColor: AppColors.whiteColor,
                    hintText: "+183 746 8373 829",
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
                      maxHeight: Get.width*0.08,
                      maxWidth: Get.width*0.08,
                    ),
                    hintStyle: AppTextStyle.montserrat(AppColors.greyText, Get.width*0.04, FontWeight.w500),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(const Radius.circular(30)),
                      borderSide: BorderSide(color: AppColors.greyText),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: AppColors.themeColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: AppColors.themeColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: AppColors.themeColor),
                    ),
                    isDense: true,
                    filled: true,
                  ),


                  onInputChanged: (number) {
                    number = number;
                    print(number);
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
                ),
              ),
              SizedBox(height: Get.width*0.2,),
              Text(AppDummyData.mediumText,style: AppTextStyle.montserrat(AppColors.lightGrey, Get.width*0.032, FontWeight.w500),)

            ],
          ),
        ),
      ),

    );
  }
}
