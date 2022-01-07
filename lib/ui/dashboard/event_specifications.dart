import 'package:amigos/helpers/bottom_sheets/congratulation_bottomsheet.dart';
import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/event_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/event_details.dart';
import 'package:amigos/ui/dashboard/home_screen.dart';
import 'package:amigos/ui/dashboard/terms_of_use.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:amigos/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

TextEditingController alreadyWithController = TextEditingController();
TextEditingController maxController = TextEditingController();

class EventSpecifications extends StatefulWidget {

   EventModel model;
   bool comingFromdit;
  EventSpecifications({ required this.model,required this.comingFromdit,});
  @override
  _EventSpecificationsState createState() => _EventSpecificationsState();
}

class _EventSpecificationsState extends State<EventSpecifications> {

  String? joinEventBy;
  bool agreeToTerm = false;

  int count = 0;




  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context,provider,_){
      return GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());

        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Get.width * 0.17),
            child: CustomAppBar(
              function: () {Get.back();},
              backButton: true,
              title: widget.comingFromdit==false?'new_event':"edit_event",
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(
                vertical: Get.width * 0.02, horizontal: Get.width * 0.07),
            color: AppColors.backGround,
            child: AppButton(
              width: Get.width * 0.9,
              onpressed: () {

                provider.events.add(widget.model);
                if(widget.comingFromdit==true)
                  {

                      provider.events[0]=widget.model;

                  }
                  else{
                  widget.model.withFriends=int.parse(alreadyWithController.text);
                  widget.model.maxFriends=int.parse(maxController.text);
                  widget.model.entryType=joinEventBy;

                }
                Get.bottomSheet(
                    const CongraulationBottomSheet(text: 'event_posted',)
                );
                  Future.delayed(Duration(seconds: 3),(){
                  Get.to(
                    EventDetails(index: 0)
                  );
                  });
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
                        if(alreadyWithController.text.isNotEmpty){
                          count = int.parse(alreadyWithController.text);
                          if(count>0)
                          {
                            count--;
                          }
                          else count=0;
                          alreadyWithController.text = count.toString();
                          setState(() {});
                        }
                        else{
                          alreadyWithController.text='0';
                          setState(() {

                          });
                        }
                      },
                      child: Image.asset(AppImages.minimize,width: Get.width*0.12,height: Get.width*0.12,),
                    ),

                    SizedBox(
                      width: Get.width * 0.03,
                    ),
                    SizedBox(
                      height: Get.width * 0.08,
                      width: Get.width * 0.25,
                      child: TextFormField(
                        decoration: AppInputDecoration.circularFieldDecoration(
                            null, '', null),
                        controller: alreadyWithController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        validator: (value)=> FieldValidator.empty(maxController.text),

                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.03,
                    ),
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
                      child:  Image.asset(AppImages.plus,width: Get.width*0.12,height: Get.width*0.12,),
                    ),

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
                          if(count>0)
                          {
                            count--;
                          }
                          else count=0;
                          maxController.text = count.toString();
                          setState(() {});
                        }
                        else{
                          maxController.text='0';
                        }
                      },
                      child: Image.asset(AppImages.minimize,width: Get.width*0.12,height: Get.width*0.12,),
                    ),
                    SizedBox(
                      width: Get.width * 0.03,
                    ),
                    Container(
                      height: Get.width * 0.08,
                      width: Get.width * 0.25,
                      padding: EdgeInsets.only(top: 3),
                      child: TextFormField(
                        decoration: AppInputDecoration.circularFieldDecoration(
                            null, '', null),
                        controller: maxController,
                        keyboardType: TextInputType.number,
                        validator: (value)=> FieldValidator.empty(maxController.text),
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
                          count++;
                          maxController.text = count.toString();
                          setState(() {});
                        }
                        else{
                          maxController.text='1';
                        }
                      },
                      child: Image.asset(AppImages.plus,width: Get.width*0.12,height: Get.width*0.12,),
                    ),
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
                      borderRadius: BorderRadius.circular(30),
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
                            child: Container(
                              child: Text(
                                value,
                                style: AppTextStyle.poppins(
                                  AppColors.shadedBlack,
                                  Get.width * 0.035,
                                  FontWeight.w500,
                                ),
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
                    GestureDetector(
                      onTap: (){
                        Get.to(()=>TermsOfUse(termsOfUse: true));
                      },
                      child: Text(
                        getTranslated(context, "terms_&_condition") ?? "",
                        style: AppTextStyle.montserrat(AppColors.themeColor,
                            Get.width * 0.03, FontWeight.w500),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );

    });
  }
}
