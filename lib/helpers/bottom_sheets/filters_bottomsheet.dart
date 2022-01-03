import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/app_button_selected.dart';
import 'package:amigos/helpers/widgets/mood_type_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:provider/provider.dart';

class FiltersBottomSheet extends StatefulWidget {
  const FiltersBottomSheet({Key? key}) : super(key: key);

  @override
  _FiltersBottomSheetState createState() => _FiltersBottomSheetState();
}

class _FiltersBottomSheetState extends State<FiltersBottomSheet> {
  List <String> musicTaste=[
    "pop",
    "rock",
    "funk",
    "jazz",
    "soul",
  ];
  List <String> typeofEvents=[
    "private_events",
    "communication_events",
    "activites",
  ];
  List <String> friends=[
    "all",
    "favorites",
    "contact_list",
    "squard",
  ];
  List <String> timeDuration=[
    "now",
    "today",
    "tomorrow",
    "week",
  ];
  SfRangeValues _values = SfRangeValues(4.0, 8.0);
  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder:(context,provider,_){
      return  Container(
        height: Get.height*0.8,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
          color: AppColors.whiteColor,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Get.width*0.02,
        ),
        child: Column(
          children: [
            SizedBox(
              height: Get.width*0.03,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Get.width*0.4,
                        ),
                        Text(
                          getTranslated(context, 'filters')??"",
                          style: AppTextStyle.montserrat(
                              AppColors.black,
                              Get.width*0.06,
                              FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: (){},
                            icon:  Icon(Icons.close,size: Get.width*0.08),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.width*0.04,
                    ),
                    Text(
                      getTranslated(context, 'moods')??"",
                      style: AppTextStyle.montserrat(
                        AppColors.shadedBlack,
                        Get.width*0.05,
                        FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.02,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(provider.eventTypes.length, (index){
                          return MoodTypeWidget(type:provider.eventTypes[index],isTitle: false,);
                        }),
                      ),
                    ),
                    Text(
                      getTranslated(context, 'music_taste')??"",
                      style: AppTextStyle.montserrat(
                        AppColors.shadedBlack,
                        Get.width*0.05,
                        FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.02,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:List.generate(
                            musicTaste.length,
                                (index) => AppButtonSelected(title: musicTaste[index],)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.04,
                    ),
                    Text(
                      getTranslated(context, 'type_of_events')??"",
                      style: AppTextStyle.montserrat(
                        AppColors.shadedBlack,
                        Get.width*0.05,
                        FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.02,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:List.generate(
                            typeofEvents.length,
                                (index) => AppButtonSelected(title: typeofEvents[index],)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.04,
                    ),
                    Text(
                      getTranslated(context, 'friends')??"",
                      style: AppTextStyle.montserrat(
                        AppColors.shadedBlack,
                        Get.width*0.05,
                        FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.02,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:List.generate(
                            friends.length,
                                (index) => AppButtonSelected(title: friends[index],)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.04,
                    ),
                    Text(
                      getTranslated(context, 'time_duration')??"",
                      style: AppTextStyle.montserrat(
                        AppColors.shadedBlack,
                        Get.width*0.05,
                        FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.02,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:List.generate(
                            timeDuration.length,
                                (index) => AppButtonSelected(title: timeDuration[index],)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.04,
                    ),
                    Text(
                      getTranslated(context, 'age_range')??"",
                      style: AppTextStyle.montserrat(
                        AppColors.shadedBlack,
                        Get.width*0.05,
                        FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.02,
                    ),
                    SfRangeSlider(
                      startThumbIcon: Container(
                        width:50,
                        height:50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      endThumbIcon: Container(
                        width:50,
                        height:50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      min: 2.0,
                      max: 10.0,
                      interval: 1,
                      activeColor: AppColors.themeColor,
                      inactiveColor: AppColors.grey,
                      values: _values,
                      onChanged: (SfRangeValues newValues){
                        setState(() {
                          _values = newValues;
                        });
                      },
                    ),
                    SizedBox(
                      height: Get.width*0.02,
                    ),
                    Text(
                      getTranslated(context, 'distance')??"",
                      style: AppTextStyle.montserrat(
                        AppColors.shadedBlack,
                        Get.width*0.05,
                        FontWeight.w500,
                      ),
                    ),
                    SfSlider(
                      thumbIcon: Container(
                        width:50,
                        height:50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor,
                        ),
                      ),
                      activeColor: AppColors.themeColor,
                      inactiveColor: AppColors.grey,
                      min: 0.0,
                      max: 100.0,
                      value: _currentSliderValue,
                      enableTooltip: true,
                      minorTicksPerInterval: 1,
                      onChanged: (value) {
                        setState(() {
                          _currentSliderValue=value;
                        });
                      },
                    ),
                    SizedBox(
                      height: Get.width*0.02,
                    ),
                    AppButton(
                        buttonText: 'apply_filters',
                        onpressed: (){},
                        width: Get.width*0.95,
                        isWhite:false
                    ),
                    SizedBox(
                      height: Get.width*0.02,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // padding: EdgeInsets.symmetric(horizontal: Get.width*0.05),
      );
    });
  }
}
