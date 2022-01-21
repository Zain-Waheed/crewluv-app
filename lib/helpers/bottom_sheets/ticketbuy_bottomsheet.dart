import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:amigos/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketBuy extends StatefulWidget {
  const TicketBuy({Key? key}) : super(key: key);

  @override
  _TicketBuyState createState() => _TicketBuyState();
}

class _TicketBuyState extends State<TicketBuy> {
  TextEditingController guestController = TextEditingController();
  TextEditingController nameOnCardController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                             boxShadow: [
                               BoxShadow(
                                   color: AppColors.black.withOpacity(0.5),
                                   offset: Offset(0, 0.1),
                                   blurRadius: 1.0)
                             ]
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
                       SizedBox(
                         width: Get.width * 0.09,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           GestureDetector(
                             onTap: () {
                               if(guestController.text.isNotEmpty){
                                 count = int.parse(guestController.text);
                                 if(count>0)
                                 {
                                   count--;
                                 }
                                 else count=0;
                                 guestController.text = count.toString();
                                 setState(() {});
                               }
                               else{
                                 guestController.text='0';
                                 setState(() {

                                 });
                               }
                             },
                             child: Container(
                               width: Get.width*0.12,
                               height: Get.width*0.12,
                               child: Image.asset(AppImages.minimize),
                             ),
                           ),
                           SizedBox(
                             width: Get.width * 0.03,
                           ),
                           SizedBox(
                             height: Get.width * 0.1,
                             width: Get.width * 0.25,
                             child: TextField(
                               decoration: AppInputDecoration.circularFieldDecoration(
                                   null, '', null),
                               controller: guestController,
                               keyboardType: TextInputType.number,
                               textAlign: TextAlign.center,
                             ),
                           ),
                           SizedBox(
                             width: Get.width * 0.03,
                           ),
                           GestureDetector(
                             onTap: () {
                               if(guestController.text.isNotEmpty)
                               {
                                 count = int.parse(guestController.text);
                                 count++;
                                 guestController.text = count.toString();
                                 setState(() {});
                               }
                               else
                               {
                                 guestController.text='1';
                                 setState(() {

                                 });
                               }

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
                         FieldValidator.validateName(nameOnCardController.text),
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
                     validator: (value) =>
                         FieldValidator.validateCardNumber(nameOnCardController.text),
                     autovalidateMode: AutovalidateMode.onUserInteraction,
                     controller: nameOnCardController,
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
                           autovalidateMode: AutovalidateMode.onUserInteraction,
                           keyboardType: TextInputType.number,
                           validator: (value) =>
                               FieldValidator.validateCardDate(dateController.text),
                           decoration: AppInputDecoration.circularFieldDecorationSmall(
                             null,
                             'expiry',
                             null,
                           ),
                         ),
                       ),
                       Spacer(),
                       Container(
                         width: Get.width * 0.43,
                         child: TextFormField(
                           keyboardType: TextInputType.number,
                           autovalidateMode: AutovalidateMode.onUserInteraction,
                           controller: cvcController,
                           validator: (value) =>
                               FieldValidator.validateCVC(cvcController.text),
                           textInputAction: TextInputAction.next,
                           obscureText: true,
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
                     onpressed: () {},
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
        ],
      ),
    );
  }
}
