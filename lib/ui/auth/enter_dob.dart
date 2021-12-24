import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/ui/dashboard/create_event.dart';
import 'package:amigos/ui/auth/select_gender.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:amigos/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class EnterDOB extends StatefulWidget {
  const EnterDOB({Key? key}) : super(key: key);

  @override
  _EnterDOBState createState() => _EnterDOBState();
}

class _EnterDOBState extends State<EnterDOB> {
  TextEditingController dobController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime _dob=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          TextFormField(
            readOnly: true,
            validator: (value)=> FieldValidator.empty(dobController.text),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: dobController,
            decoration: AppInputDecoration.circularFieldDecoration(null, 'd/m/y', Image.asset(AppImages.calendarIcon,),),
            onTap:(){
              showDatePicker(
                context: context,
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: ThemeData(
                      primarySwatch: Colors.grey,
                      splashColor: Colors.black,
                      textTheme: TextTheme(
                        subtitle1: TextStyle(color: Colors.black),
                        button: TextStyle(color: Colors.black),
                      ),
                      colorScheme: ColorScheme.light(
                          primary: AppColors.orangeDark,
                          onPrimary: Color(0xFFFFFFFF),
                          surface: Colors.black,
                          onSurface: Colors.black,
                          secondary: Colors.black),
                    ),
                    child: child ??Text(""),
                  );
                },
                initialDate: _dob,
                firstDate: DateTime.now(),
                lastDate: DateTime(2050),

              ).then((date){
                setState(() {
                  _dob=date!;
                  final DateFormat formatter = DateFormat('dd-MM-yyyy');
                  final String formatted = formatter.format(date);
                  dobController.text=formatted;
                });
              },
              );
            }
          ),
          SizedBox(height: Get.width * 0.15),



        ],
      ),
    );
  }
}
