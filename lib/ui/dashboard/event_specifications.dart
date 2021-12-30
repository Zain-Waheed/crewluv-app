import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/event_model.dart';
import 'package:amigos/ui/dashboard/home_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventSpecifications extends StatefulWidget {

  EventModel model;

  EventSpecifications({ required this.model});

  @override
  _EventSpecificationsState createState() => _EventSpecificationsState();
}

class _EventSpecificationsState extends State<EventSpecifications> {
  String? joinEventBy;
  bool agreeToTerm = false;
  TextEditingController alreadyWithController = TextEditingController();
  TextEditingController maxController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.width * 0.17),
        child: CustomAppBar(
          function: () {Get.back();},
          backButton: true,
          title: 'new_event',
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
            vertical: Get.width * 0.02, horizontal: Get.width * 0.07),
        color: AppColors.backGround,
        child: AppButton(
          width: Get.width * 0.9,
          onpressed: () {
            widget.model.withFriends=int.parse(alreadyWithController.text);
            widget.model.maxFriends=int.parse(maxController.text);
            widget.model.entryType=joinEventBy;
            Get.to(() => const HomeScreen());
          },
          buttonText: 'post_event',
          isWhite: false,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.width * 0.1,
            ),
            Text(
              getTranslated(context, "with_people") ?? "",
              style: AppTextStyle.montserrat(
                  AppColors.shadedBlack, Get.width * 0.045, FontWeight.w600),
            ),
            SizedBox(
              height: Get.width * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if(alreadyWithController.text.isNotEmpty)
                      {
                        count = int.parse(alreadyWithController.text);
                        count++;
                        alreadyWithController.text = count.toString();
                        setState(() {});
                      }
                    else
                      {
                        alreadyWithController.text='1';
                        setState(() {

                        });
                      }

                  },
                  child: Container(
                    child: Icon(
                      Icons.add,
                      color: AppColors.whiteColor,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.03,
                ),
                SizedBox(
                  height: Get.width * 0.08,
                  width: Get.width * 0.25,
                  child: TextField(
                    decoration: AppInputDecoration.circularFieldDecoration(
                        null, '', null),
                    controller: alreadyWithController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    if(alreadyWithController.text.isNotEmpty){
                      count = int.parse(alreadyWithController.text);
                      count--;
                      alreadyWithController.text = count.toString();
                      setState(() {});
                    }
                    else{
                      alreadyWithController.text='0';
                      setState(() {

                      });
                    }
                  },
                  child: Container(
                    child: Icon(
                      Icons.minimize_rounded,
                      color: AppColors.whiteColor,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.width * 0.08,
            ),
            Text(getTranslated(context, "max_friends") ?? "",
                style: AppTextStyle.montserrat(AppColors.shadedBlack,
                    Get.width * 0.045, FontWeight.w600)),
            SizedBox(
              height: Get.width * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if(maxController.text.isNotEmpty)
                      {
                        count = int.parse(maxController.text);
                        count++;
                        maxController.text = count.toString();
                        setState(() {});
                      }
                    else{
                      maxController.text='1';
                    }
                  },
                  child: Container(
                    child: Icon(
                      Icons.add,
                      color: AppColors.whiteColor,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.03,
                ),
                Container(
                  height: Get.width * 0.08,
                  width: Get.width * 0.25,
                  padding: EdgeInsets.only(top: 3),
                  child: TextField(
                    decoration: AppInputDecoration.circularFieldDecoration(
                        null, '', null),
                    controller: maxController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                   if(maxController.text.isNotEmpty)
                     {
                       count = int.parse(maxController.text);
                       count--;
                       maxController.text = count.toString();
                       setState(() {});
                     }
                     else{
                       maxController.text='0';
                   }
                  },
                  child: Container(
                    child: Icon(
                      Icons.minimize_rounded,
                      color: AppColors.whiteColor,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.width * 0.08,
            ),
            Text(
              getTranslated(context, "can_everyone_join") ?? "",
              style: AppTextStyle.montserrat(
                  AppColors.shadedBlack, Get.width * 0.045, FontWeight.w600),
              maxLines: 1,
              overflow: null,
            ),
            SizedBox(
              height: Get.width * 0.05,
            ),
            Container(
              width: Get.width * 0.8,
              height: Get.width * 0.14,
              margin: EdgeInsets.only(left: Get.width * 0.05),
              padding: EdgeInsets.only(right: Get.width * 0.05),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.genderBorder,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.silverWhite),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(30),
                  focusColor: AppColors.silverWhite,
                  elevation: 0,
                  dropdownColor: AppColors.silverWhite,
                  style: AppTextStyle.montserrat(AppColors.shadedBlack,
                      Get.width * 0.04, FontWeight.w500),
                  items: <String>[
                    getTranslated(context, "join_on_request") ?? "",getTranslated(context, "buy_ticket")??"",
                    getTranslated(context, "but_ticket") ?? "",
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.03),
                        child: Text(
                          value,
                          style: AppTextStyle.poppins(
                            AppColors.shadedBlack,
                            Get.width * 0.035,
                            FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    joinEventBy = value ?? "";
                    setState(() {});
                  },
                  value: joinEventBy,
                  hint: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    child: Text(
                      getTranslated(context, "join_on_request") ?? "",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.poppins(
                        AppColors.shadedBlack,
                        Get.width * 0.035,
                        FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.width * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    value: agreeToTerm,
                    activeColor: AppColors.themeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    onChanged: (value) {
                      agreeToTerm = value!;
                      setState(() {});
                    }),
                Text(
                  getTranslated(context, "agree_to_friends") ?? "",
                  style: AppTextStyle.montserrat(AppColors.shadedBlack,
                      Get.width * 0.03, FontWeight.w500),
                ),
                SizedBox(width: 10),
                Text(
                  getTranslated(context, "terms_&_condition") ?? "",
                  style: AppTextStyle.montserrat(AppColors.themeColor,
                      Get.width * 0.03, FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
