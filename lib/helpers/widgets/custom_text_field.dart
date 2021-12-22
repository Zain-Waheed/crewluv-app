// import 'package:amigos/localization/app_localization.dart';
// import 'package:flutter/material.dart';
// class CustomTextField extends StatefulWidget {
//
//   Widget preficIcon;
//   String hint;
//   Widget suffixIcon;
//
//   CustomTextField(this.preficIcon, this.hint, this.suffixIcon);
//
//   @override
//   _CustomTextFieldState createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: getTranslated(Get.context, hintText),
//         suffixIcon: Container(
//             margin: EdgeInsets.only(right: Get.width*0.03),
//             child: suffixIcon
//         ),
//         suffixIconConstraints: BoxConstraints(
//           maxHeight: Get.width*0.08,
//           maxWidth: Get.width*0.08,
//         ),
//         hintStyle: AppTextStyle.montserrat(AppColors.greyText, Get.width*0.04, FontWeight.w500),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: const BorderRadius.all(Radius.circular(30)),
//           borderSide: BorderSide(color: AppColors.greyText),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: const BorderRadius.all(Radius.circular(30)),
//           borderSide: BorderSide(color: AppColors.themeColor),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: const BorderRadius.all(Radius.circular(30)),
//           borderSide: BorderSide(color: AppColors.themeColor),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: const BorderRadius.all(Radius.circular(30)),
//           borderSide: BorderSide(color: AppColors.themeColor),
//         ),
//         isDense: true,
//         filled: true,
//       ),
//     );
//   }
// }
