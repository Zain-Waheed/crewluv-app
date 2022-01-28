import 'package:amigos/helpers/bottom_sheets/congratulation_bottomsheet.dart';
import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:amigos/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class TicketBuy extends StatefulWidget {
  const TicketBuy({Key? key}) : super(key: key);

  @override
  _TicketBuyState createState() => _TicketBuyState();
}

class _TicketBuyState extends State<TicketBuy> {
  TextEditingController guestController = TextEditingController();
  TextEditingController nameOnCardController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  var dateController = new MaskedTextController(mask: '00/00');
  TextEditingController cvcController = TextEditingController();
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        FocusScope.of(Get.context!).requestFocus(new FocusNode());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: AppColors.whiteColor,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.04,
        ),
        child: Column(
          children: [
            SizedBox(
              width: Get.width*0.35,
            ),
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
              width: Get.width*0.35,
            ),
            Text(
              getTranslated(context, 'payments_details') ?? "",
              style: AppTextStyle.montserrat(
                AppColors.shadedBlack,
                Get.width * 0.05,
                FontWeight.w700,
              ),
            ),
            SizedBox(
              height: Get.width * 0.06,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                     children: [
                       Row(
                         children: [
                           Container(
                             padding: EdgeInsets.symmetric(
                                 horizontal: Get.width * 0.06, vertical: Get.width * 0.03),
                             decoration: BoxDecoration(
                                 shape: BoxShape.rectangle,
                                 color: AppColors.white,
                             ),
                             child: Text(
                               '\$' + '125',
                               style: AppTextStyle.montserrat(
                                 AppColors.shadedBlack,
                                 Get.width * 0.05,
                                 FontWeight.w700,
                               ),
                             ),
                           ),
                           Container(
                             height: Get.width * 0.12,
                             padding: EdgeInsets.symmetric(horizontal: Get.width * 0.004),
                             margin: EdgeInsets.symmetric(horizontal: Get.width * 0.005),
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                 color: AppColors.bottomSheetGrey),
                           ),
                           SizedBox(
                             width: Get.width * 0.09,
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               GestureDetector(
                                 onTap: () {
                                   if(count>0)
                                   {
                                     setState(() {
                                       count--;
                                     });
                                   }else
                                     {
                                       setState(() {
                                         count=0;
                                       });
                                     }
                                 },
                                 child: Container(
                                   width: Get.width*0.12,
                                   height: Get.width*0.12,
                                   child: Image.asset(AppImages.minimize),
                                 ),
                               ),
                               Container(
                                 height: Get.width * 0.1,
                                 width: Get.width * 0.3,
                                 alignment: Alignment.center,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20),
                                   color: AppColors.offWhite,
                                 ),
                                 child: Text(count.toString(),
                                 style: TextStyle(
                                   color: AppColors.shadedBlack,
                                   fontSize: Get.width*0.04,
                                   fontWeight: FontWeight.w500,
                                 ),),
                               ),
                               GestureDetector(
                                 onTap: () {
                                   setState(() {
                                     count++;
                                   });
                                   // if(guestController.text.isNotEmpty)
                                   // {
                                   //   count = int.parse(guestController.text);
                                   //   count++;
                                   //   guestController.text = count.toString();
                                   //   setState(() {});
                                   // }
                                   // else
                                   // {
                                   //   guestController.text='1';
                                   //   setState(() {
                                   //
                                   //   });
                                   // }

                                 },
                                 child: Container(
                                   width: Get.width*0.12,
                                   height: Get.width*0.12,
                                   child: Image.asset(AppImages.plus),
                                 ),
                               ),
                             ],
                           ),
                         ],
                       ),
                       SizedBox(
                         height: Get.width * 0.08,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text(
                             getTranslated(context, 'card_details') ?? "",
                             style: AppTextStyle.montserrat(
                               AppColors.shadedBlack,
                               Get.width * 0.05,
                               FontWeight.w500,
                             ),
                           ),
                         ],
                       ),
                       SizedBox(
                         height: Get.width * 0.05,
                       ),
                       TextFormField(

                         validator: (value) =>
                             FieldValidator.empty(nameOnCardController.text),
                         autovalidateMode: AutovalidateMode.onUserInteraction,
                         controller: nameOnCardController,
                         decoration: AppInputDecoration.circularFieldDecorationSmall(
                           null,
                           'name_on_card',
                           null,
                         ),
                       ),
                       SizedBox(
                         height: Get.width * 0.05,
                       ),
                       TextFormField(
                         keyboardType: TextInputType.number,
                         inputFormatters: [
                           // WhitelistingTextInputFormatter.digitsOnly,
                           new LengthLimitingTextInputFormatter(16),
                         ],
                         validator: (value) =>
                             FieldValidator.validateCardNumber(cardNumberController.text),
                         autovalidateMode: AutovalidateMode.onUserInteraction,
                         controller: cardNumberController,
                         decoration: AppInputDecoration.circularFieldDecorationSmall(
                           null,
                           'card_number',
                           null,
                         ),
                       ),
                       SizedBox(
                         height: Get.width * 0.05,
                       ),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             width: Get.width * 0.46,
                             child: TextFormField(
                               controller: dateController,
                               maxLength: 5,
                               keyboardType: TextInputType.number,
                               autovalidateMode: AutovalidateMode.onUserInteraction,
                               validator: (value) => FieldValidator.validateCardDate(dateController.text),
                               decoration: AppInputDecoration.circularFieldDecorationSmall(
                                 null,
                                 'mm_yy',
                                 null,
                               ),
                             ),
                           ),
                           Spacer(),
                           Container(
                             width: Get.width * 0.43,
                             child: TextFormField(
                               maxLength: 3,
                               keyboardType: TextInputType.number,
                               autovalidateMode: AutovalidateMode.onUserInteraction,
                               controller: cvcController,
                               validator: (value) =>
                                   FieldValidator.validateCVC(cvcController.text),
                               textInputAction: TextInputAction.next,
                               // obscureText: true,
                               decoration: AppInputDecoration.circularFieldDecorationSmall(
                                 null,
                                 'cvv',
                                 null,
                               ),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(
                         height: Get.width * 0.05,
                       ),
                       AppButton(
                         buttonText: 'pay_now',
                         onpressed: () {
                           if(formKey.currentState!.validate()){
                             if(count<=0)
                               {
                                 Fluttertoast.showToast(
                                   msg: getTranslated(context, 'first_add_a_ticket')??"",
                                   toastLength: Toast.LENGTH_SHORT,
                                   gravity: ToastGravity.CENTER,
                                 );
                               }else{
                               Get.back();
                               Get.bottomSheet(CongraulationBottomSheet(text: 'you_have_successfully_brought_a_ticket',comingFromPartyList: true,));

                             }
                           }
                         },
                         width: Get.width * 300,
                         isWhite: false,
                       ),
                       SizedBox(
                         height: Get.width * 0.03,
                       ),
                     ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
