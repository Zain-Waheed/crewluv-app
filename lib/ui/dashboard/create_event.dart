import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/appbar_button.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/helpers/widgets/mood_type_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/models/event_model.dart';
import 'package:amigos/models/event_type_model.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/auth/complete_profile_screen.dart';
import 'package:amigos/ui/dashboard/event_specifications.dart';
import 'package:amigos/ui/dashboard/live_map_locaion.dart';
import 'package:amigos/ui/dashboard/ploylines_screens.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:amigos/utils/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

class CreateEvent extends StatefulWidget {
  bool comingFromEdit;
  EventModel? editEventModel;
  CreateEvent({required this.comingFromEdit,this.editEventModel});

  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  final Geolocator geolocator = Geolocator();
  late Address address;
  LatLng?  addressPoints;
  DateTime eventDateTime =DateTime.now();

  String startDate = DateFormat('MMM dd').format(DateTime.now()).toString();
  String endDate = DateFormat('MMM dd').format(DateTime.now()).toString();
  String startHour= '0';
  String endHour= '0';
  String startMinute= '0';
  String endMinute= '0';
  TimeOfDay? selectedTime = TimeOfDay.now();
  TextEditingController titleController= TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController locationController = TextEditingController();
  EventModel model=EventModel(personalEvent: false);
  bool isSelected = false;
  FocusNode focus = new FocusNode();

  @override
  void initState() {
   if(widget.comingFromEdit==true)
     {
       titleController.text=widget.editEventModel!.title??'';
       descriptionController.text= widget.editEventModel!.description??'';
       locationController.text = widget.editEventModel!.liveLocation??'';
       startDate = widget.editEventModel!.day??'';
       endDate =widget.editEventModel!.day??'';
       startHour = "${widget.editEventModel!.startTime![0]} ${widget.editEventModel!.startTime![1]}";
       // startMinute = "${widget.editEventModel!.startTime![3]}${widget.editEventModel!.startTime![4]}";
       endHour ="${widget.editEventModel!.endTime![0]}${widget.editEventModel!.endTime![1]}";
       // endMinute ="${widget.editEventModel!.endTime![3]}${widget.editEventModel!.endTime![4]}";
       alreadyWithController.text= widget.editEventModel!.withFriends.toString();
       maxController.text=widget.editEventModel!.maxFriends.toString();
     }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, _) {
      return GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          backgroundColor: AppColors.backGround,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Get.width * 0.17),
            child: CustomAppBar(
              function: () {
                Get.back();
              },
              backButton: false,
              title: widget.comingFromEdit==false?'new_event':"edit_event",
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(vertical: Get.width*0.02,horizontal: Get.width*0.07),
             color: AppColors.backGround,
            child: AppButton(
              width: Get.width*0.9,
              onpressed: (){
                if(formKey.currentState!.validate())
                  {
                    model.title = titleController.text;
                    model.description =descriptionController.text;
                    model.liveLocation =locationController.text;
                    model.day=startDate;
                    model.startTime= startHour+':'+startMinute;
                    model.endTime= endHour+':'+endMinute;
                    Get.to(()=>  EventSpecifications(model: model,comingFromdit: widget.comingFromEdit,));
                  }
                },
              buttonText: 'Save_&_continue',
              isWhite: false,
            ) ,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: Get.width*0.05),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.width*0.05,),
                    Text(getTranslated(context, 'invite_friends_to')??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.05, FontWeight.w600),),
                    SizedBox(height: Get.width*0.05,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(provider.eventTypes.length, (index){
                          return GestureDetector(
                             onTap: (){
                               for(int i=0;i<provider.eventTypes.length;i++){
                                 provider.eventTypes[i].isSelected =false;
                               }
                               provider.eventTypes[index].isSelected= !isSelected;
                               provider.update();
                             },
                              child: MoodTypeWidget(type:provider.eventTypes[index])
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: Get.width*0.06,),
                    Text(getTranslated(context, 'title')??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),),
                    SizedBox(height: Get.width*0.01,),
                    TextFormField(
                      decoration: AppInputDecoration.circularFieldDecoration(null, 'enter_your_title', null),
                      controller: titleController,
                      validator: (value)=> FieldValidator.validateText(titleController.text),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: Get.width*0.06,),
                    Text(getTranslated(context, 'description')??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),),
                    SizedBox(height: Get.width*0.01,),
                    TextFormField(
                      decoration: AppInputDecoration.lessCircularDecoration(null, 'invitation_description', null,AppColors.offWhite),
                      controller: descriptionController,
                      maxLines: 3,
                      validator: (value)=> FieldValidator.validateText(descriptionController.text),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: Get.width*0.06,),
                    Text(getTranslated(context, 'location')??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),),
                    SizedBox(height: Get.width*0.01,),
                    TextFormField(
                      focusNode: focus,
                      decoration: AppInputDecoration.circularFieldDecoration(null, 'live_location',
                          Image.asset(AppImages.gps,color: AppColors.solidGrey,)
                      ),
                      controller: locationController,
                      onTap: (){
                        setState(() {

                        });
                        Get.to(
                            AddPropertyLocationScreen()
                           // LiveMapLocation()
                        )?.then((value) async {

                         //  addressPoints= value;
                         await _getLocation(value!);
                         //  await   _determinePosition(value);
                        });
                        // Fluttertoast.showToast(msg: getTranslated(context, 'fetching_location')??'');

                      },
                      readOnly: true,
                      validator: (value)=> FieldValidator.validateText(locationController.text),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: Get.width*0.04,),
                    Text(getTranslated(context, "date_time")??"",style: AppTextStyle.montserrat(AppColors.shadedBlack, Get.width*0.04, FontWeight.w500),),
                    SizedBox(height: Get.width*0.04,),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: AppColors.black.withOpacity(0.05),blurRadius: 5,offset: Offset(0,5))
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap:() {
                                      _selectDate(context,1);
                                    },
                                    child: Container(
                                      height: Get.width*0.12,
                                      width: Get.width*0.32,
                                      decoration: BoxDecoration(
                                        color: AppColors.themeBlue,
                                        borderRadius:const BorderRadius.only(topRight:Radius.circular(12),topLeft: Radius.circular(12)),
                                      ),
                                      child: Center(child: Text(startDate,style: AppTextStyle.montserrat(AppColors.whiteColor, Get.width*0.035, FontWeight.w500),)),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      _selectTime(context, 1);
                                    },
                                    child: Container(
                                      height: Get.width*0.18,
                                      width: Get.width*0.32,
                                      padding: EdgeInsets.symmetric(horizontal:Get.width*0.015),
                                      decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5),)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: Get.width*0.13,
                                            width: Get.width*0.13,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: AppColors.genderBorder),
                                              borderRadius: BorderRadius.circular(5),
                                              color: AppColors.silverWhite,
                                            ),
                                            child: Center(child: Text(startHour)),
                                          ),
                                          const Text(':'),
                                          Container(
                                            height: Get.width*0.13,
                                            width: Get.width*0.13,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: AppColors.genderBorder),
                                              borderRadius: BorderRadius.circular(5),
                                              color: AppColors.silverWhite,
                                            ),
                                            child: Center(child: Text(startMinute)),
                                          ),
                                        ],
                                      ),

                                    ),
                                  )

                                ],

                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap:() {
                                      _selectDate(context,2);
                                    },
                                    child: Container(
                                      height: Get.width*0.12,
                                      width: Get.width*0.32,
                                      decoration: BoxDecoration(
                                        color: AppColors.themeBlue,
                                        borderRadius:const BorderRadius.only(topRight:Radius.circular(12),topLeft: Radius.circular(12)),
                                      ),
                                      child: Center(child: Text(endDate,style: AppTextStyle.montserrat(AppColors.whiteColor, Get.width*0.035, FontWeight.w500),)),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      _selectTime(context, 2);
                                    },
                                    child: Container(
                                      height: Get.width*0.18,
                                      width: Get.width*0.32,
                                      padding: EdgeInsets.symmetric(horizontal:Get.width*0.015),
                                      decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5))
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: Get.width*0.13,
                                            width: Get.width*0.13,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: AppColors.genderBorder),
                                              borderRadius: BorderRadius.circular(5),
                                              color: AppColors.silverWhite,
                                            ),
                                            child: Center(child: Text(endHour)),
                                          ),
                                          const Text(':'),
                                          Container(
                                            height: Get.width*0.13,
                                            width: Get.width*0.13,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: AppColors.genderBorder),
                                              borderRadius: BorderRadius.circular(5),
                                              color: AppColors.silverWhite,
                                            ),
                                            child: Center(child: Text(endMinute)),
                                          ),
                                        ],
                                      ),

                                    ),
                                  )

                                ],

                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                    SizedBox(height: Get.width*0.04,),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  _selectDate(BuildContext? context,int index) async {
    final DateTime? selected = await showDatePicker(
      context: context!,
      initialDate: eventDateTime,
      firstDate: eventDateTime,
      locale: const Locale('en', 'US'),
      lastDate: DateTime(eventDateTime.year+10,eventDateTime.month,eventDateTime.day,eventDateTime.hour,eventDateTime.minute),
      builder: (BuildContext? context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.themeBlue,
            colorScheme: ColorScheme.light(primary: AppColors.themeBlue),
          ),
          child: child!,
        );
      },
    );
    if (selected != null) {
      setState(() {
        eventDateTime = selected;
         if(index==1)
           {
             startDate   = DateFormat.MMMd().format(eventDateTime);
           }
         else{
           endDate   = DateFormat.MMMd().format(eventDateTime);
         }
      });
    }
  }
  _selectTime(BuildContext? context , int index) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context!,
      initialTime: selectedTime!,
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (BuildContext? context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.themeBlue,
            colorScheme: ColorScheme.light(primary: AppColors.themeBlue),
          ),
          child: child!,
        );
      },
    );
    if (timeOfDay != null) {
      setState(() {
        selectedTime = timeOfDay;
        if(index == 1){
          startHour = selectedTime!.hour.toString();
           startMinute= selectedTime!.minute.toString();
        }else{
          endHour = selectedTime!.hour.toString();
          endMinute = selectedTime!.minute.toString();
        }

      });
    }

  }

  // Future _determinePosition(LatLng latlongPoints) async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       Fluttertoast.showToast(msg: getTranslated(context, 'location_permissions_are_denied')??'');
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //
  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   GeoCode geoCode = GeoCode();
  //   try {
  //     address = await geoCode.reverseGeocoding(latitude: latlongPoints.latitude,longitude: latlongPoints.longitude);
  //     print("city ${address.city}");
  //     print("city ${address}");
  //     locationController.clear();
  //     locationController.text= address.countryName.toString() + address.city.toString() + address.streetAddress.toString();
  //   } catch (e) {
  //     print(e);
  //   }
  //   setState(() {
  //
  //   });
  // }

  _getLocation(LatLng latlongPoints) async
  {
    GeoCode geoCode = GeoCode();
    try {
       address = await geoCode.reverseGeocoding(latitude: latlongPoints.latitude,longitude: latlongPoints.longitude);
       print("city ${address.city}");
       print("city ${address}");
       locationController.clear();
       locationController.text= address.countryName.toString() + address.city.toString() + address.streetAddress.toString();
    } catch (e) {
      print(e);
    }
    setState(() {

    });
  }

}

