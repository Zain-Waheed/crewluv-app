import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/app_button_selected.dart';
import 'package:amigos/helpers/widgets/filters_button.dart';
import 'package:amigos/helpers/widgets/mood_type_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:provider/provider.dart';

class FiltersBottomSheet extends StatefulWidget {
  const FiltersBottomSheet({Key? key}) : super(key: key);

  @override
  _FiltersBottomSheetState createState() => _FiltersBottomSheetState();
}

class _FiltersBottomSheetState extends State<FiltersBottomSheet> {

  SfRangeValues _values = SfRangeValues(4.0, 8.0);
  double _currentSliderValue = 0;
  bool value=false;
  bool isSelected= false;
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
        child: Column(
          children: [
            SizedBox(
              height: Get.width*0.015,
            ),
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
                    Get.width*0.05,
                    FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: (){Get.back();},
                  icon:  Icon(Icons.close,size: Get.width*0.07),
                ),
                SizedBox(
                  width: Get.width*0.025,
                ),
              ],
            ),
            SizedBox(
              height: Get.width*0.001,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,),
                      child: Text(
                        getTranslated(context, 'moods')??"",
                        style: AppTextStyle.montserrat(
                          AppColors.shadedBlack,
                          Get.width*0.04,
                          FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.015,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(provider.eventTypes.length, (index){
                          return GestureDetector(
                              onTap: (){
                                for(int i=0;i<provider.eventTypes.length;i++){
                                  provider.eventTypes[i].isSelected =false;
                                }
                                provider.eventTypes[index].isSelected= !isSelected;
                                setState(() {

                                });
                              },
                              child: MoodTypeWidget(type:provider.eventTypes[index],isTitle: false,));
                        }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,),
                      child: Text(
                        getTranslated(context, 'music_taste')??"",
                        style: AppTextStyle.montserrat(
                          AppColors.shadedBlack,
                          Get.width*0.04,
                          FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.008,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:List.generate(
                            provider.filters.musicTaste.length,
                                (index) => GestureDetector(
                                     onTap: (){
                                       value =provider.filters.musicTaste[index].isSelected;
                                       provider.filters.musicTaste[index].isSelected=!value;
                                       setState(() {
                                       });
                                     },
                                    child: FiltersButton(model: provider.filters.musicTaste[index],))
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.008,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,),
                      child: Text(
                        getTranslated(context, 'type_of_events')??"",
                        style: AppTextStyle.montserrat(
                          AppColors.shadedBlack,
                          Get.width*0.04,
                          FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.008,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:List.generate(
                            provider.filters.eventTypes.length,
                                (index) => GestureDetector(
                                    onTap: (){
                                      value =provider.filters.eventTypes[index].isSelected;
                                      provider.filters.eventTypes[index].isSelected=!value;
                                      setState(() {
                                      });
                                    },
                                    child: FiltersButton(model: provider.filters.eventTypes[index],))
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.008,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,),
                      child: Text(
                        getTranslated(context, 'friends')??"",
                        style: AppTextStyle.montserrat(
                          AppColors.shadedBlack,
                          Get.width*0.04,
                          FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.008,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:List.generate(
                            provider.filters.friend.length,
                                (index) => GestureDetector(
                                    onTap: (){
                                      value =provider.filters.friend[index].isSelected;
                                      provider.filters.friend[index].isSelected=!value;
                                      setState(() {

                                      });
                                    },
                                    child: FiltersButton(model: provider.filters.friend[index],))
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.008,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,),
                      child: Text(
                        getTranslated(context, 'time_duration')??"",
                        style: AppTextStyle.montserrat(
                          AppColors.shadedBlack,
                          Get.width*0.04,
                          FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.008,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:List.generate(
                            provider.filters.timeDuration.length,
                                (index) => GestureDetector(
                                    onTap: (){
                                      value =provider.filters.timeDuration[index].isSelected;
                                      provider.filters.timeDuration[index].isSelected=!value;
                                      setState(() {

                                      });
                                    },
                                    child: FiltersButton(model:provider.filters.timeDuration[index]))
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.008,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,),
                      child: Row(
                        children: [
                          Text(
                            getTranslated(context, 'age_range')??"",
                            style: AppTextStyle.montserrat(
                              AppColors.shadedBlack,
                              Get.width*0.04,
                              FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "${_values.start.toStringAsFixed(0)}-${_values.end.toStringAsFixed(0)}y/o",
                            style: AppTextStyle.montserrat(
                              AppColors.shadedBlack,
                              Get.width*0.035,
                              FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.008,
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
                      min: 0,
                      max: 70.0,
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
                      height: Get.width*0.008,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,),
                      child: Row(
                        children: [

                          Text(
                            getTranslated(context, 'distance')??"",
                            style: AppTextStyle.montserrat(
                              AppColors.shadedBlack,
                              Get.width*0.04,
                              FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "${_currentSliderValue.toStringAsFixed(1)} mi",
                            style: AppTextStyle.montserrat(
                              AppColors.shadedBlack,
                              Get.width*0.035,
                              FontWeight.w500,
                            ),
                          ),


                        ],
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
                      height: Get.width*0.008,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width*0.05,),
                      child: AppButton(
                          buttonText: 'apply_filters',
                          onpressed: (){
                            provider.filters.age=_values;
                            provider.filters.distance=_currentSliderValue;

                          },
                          width: Get.width*0.95,
                          isWhite:false
                      ),
                    ),
                    SizedBox(
                      height: Get.width*0.03,
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
