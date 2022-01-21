import 'dart:io';

import 'package:amigos/helpers/bottom_sheets/edit_gender_bottomsheet.dart';
import 'package:amigos/helpers/bottom_sheets/ticketbuy_bottomsheet.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/helpers/widgets/crew_members_widget.dart';
import 'package:amigos/helpers/widgets/custom_appbar.dart';
import 'package:amigos/helpers/widgets/event_widget.dart';
import 'package:amigos/helpers/widgets/ticket_dialog.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/ui/dashboard/create_event.dart';
import 'package:amigos/ui/dashboard/dashboard.dart';
import 'package:amigos/ui/dashboard/destinaiton_screen.dart';
import 'package:amigos/ui/dashboard/profiles_screen.dart';
import 'package:amigos/ui/dashboard/stories_screen.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/global_function.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EventDetails extends StatefulWidget {
  int index;

  EventDetails({Key? key, required this.index}) : super(key: key);

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  Address? address;
  Position? position;
  bool? isLoading = true;
  FilePickerResult? result;
  final CameraPosition _initialLocation = const CameraPosition(
    target: LatLng(31.4564555, 74.2852029),
    zoom: 15,
  );
  Set<Marker> markers = {};

  // late PolylinePoints polylinePoints;
  _getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("positionsssssssss${position}");

    setState(() {});
  }

  Set<Marker> getmarkers(/*LatLng tappedPoint*/) {
    // getLocAddress(tappedPoint);
    markers.add(Marker(
      //add second marker
      markerId: MarkerId("1"),
      position: LatLng(position?.latitude ?? 34.0,
          position?.longitude ?? 50), //position of marker
      onTap: () {},
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    return markers;
  }
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    _getLocation();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.backGround,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Get.width * 0.17),
            child: CustomAppBar(
              function: () {
                Get.back();
              },
              title: "event_details",
              backButton: true,
                suffix: widget.index==0?AppImages.share:null,
            ),
          ),
          body: Scrollbar(
            controller: scrollController,
            interactive: true,
            isAlwaysShown: true,
            thickness: 5,
            radius: Radius.circular(10),
            child: SingleChildScrollView(
              controller: scrollController,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.index == 1 && provider.events[0].personalEvent == true
                      ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        provider.events[0].stories.isEmpty
                            ? GestureDetector(
                          onTap: () {
                            pickFile(provider);
                          },
                          child: Stack(
                            children: [
                              Image.asset(
                                AppImages.profileImage,
                                height: Get.width * 0.22,
                                width: Get.width * 0.22,
                              ),
                              Visibility(
                                child: Positioned(
                                  right: 2,
                                  bottom: 12,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.themeColor,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                            : GestureDetector(
                          onTap: () {
                            Get.to(StoriesScreen());
                          },
                          child: Container(
                            height: Get.height * 0.12,
                            width: Get.width * 0.15,
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.015),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.themeColor,
                                  width: 2),
                              color: AppColors.white,
                            ),
                            child: Image.asset(
                              AppImages.person2,
                              fit: BoxFit.contain,
                              height: Get.width * 0.23,
                              width: Get.width * 0.23,
                              scale: 0.1,
                            ),
                          ),
                        ),
                        Row(
                          children: List.generate(
                            10,
                                (index) =>
                                Container(
                                  height: Get.height * 0.12,
                                  width: Get.width * 0.15,
                                  padding: EdgeInsets.all(2),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: Get.width * 0.015),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColors.themeColor,
                                        width: 2),
                                    color: AppColors.white,
                                  ),
                                  child: Image.asset(
                                    AppImages.notification1,
                                    fit: BoxFit.contain,
                                    height: Get.width * 0.23,
                                    width: Get.width * 0.23,
                                    scale: 0.1,
                                  ),
                                ),
                          ),
                        ),
                      ],
                    ),
                  )
                      : SizedBox(),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.opacBlack,
                                offset: Offset(0, 2),
                                blurRadius: 5)
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppImages.profile,
                                scale: 4,
                              ),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        provider.users[0].name ?? "",
                                        style: AppTextStyle.montserrat(
                                            AppColors.black3d,
                                            Get.width * 0.04,
                                            FontWeight.w500),
                                      ),
                                      const Text(', '),
                                      Text(
                                        provider.users[0].age.toString(),
                                        style: AppTextStyle.montserrat(
                                            AppColors.black3d,
                                            Get.width * 0.04,
                                            FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.02,
                                      ),
                                      provider.users[0].isVerified
                                          ? Image.asset(
                                        AppImages.verified,
                                        scale: 3,
                                      )
                                          : SizedBox(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.width * 0.02,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        AppImages.locationEvent,
                                        scale: 3,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.01,
                                      ),
                                      Text(
                                        provider.users[0].distance.toString(),
                                        style: AppTextStyle.montserrat(
                                            AppColors.shadedBlack,
                                            Get.width * 0.035,
                                            FontWeight.w400),
                                      ),
                                      Text(
                                        getTranslated(
                                          context,
                                          "miles_away",
                                        ) ??
                                            "",
                                        style: AppTextStyle.montserrat(
                                            AppColors.shadedBlack,
                                            Get.width * 0.035,
                                            FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Image.asset(
                                AppImages.privateEvent, scale: 4,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.width * 0.05,
                          ),
                          Text(
                            provider.events[0].title ?? "",
                            style: AppTextStyle.montserrat(AppColors.black,
                                Get.width * 0.04, FontWeight.w700),
                          ),
                          SizedBox(
                            height: Get.width * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: Get.width * 0.02,
                                    horizontal: Get.width * 0.03),
                                margin: EdgeInsets.symmetric(
                                    vertical: Get.width * 0.02),
                                decoration: BoxDecoration(
                                  color: AppColors.themeColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  provider.events[0].day ?? "",
                                  style: AppTextStyle.montserrat(
                                      AppColors.themeColor,
                                      Get.width * 0.035,
                                      FontWeight.w700),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: Get.width * 0.02,
                                    horizontal: Get.width * 0.03),
                                margin: EdgeInsets.symmetric(
                                    vertical: Get.width * 0.02,
                                    horizontal: Get.width * 0.02),
                                decoration: BoxDecoration(
                                  color: AppColors.themeColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  "${provider.events[0].startTime}-${provider
                                      .events[0].endTime} ",
                                  style: AppTextStyle.montserrat(
                                      AppColors.themeColor,
                                      Get.width * 0.035,
                                      FontWeight.w700),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: Get.width * 0.02,
                                    horizontal: Get.width * 0.03),
                                margin: EdgeInsets.symmetric(
                                    vertical: Get.width * 0.02),
                                decoration: BoxDecoration(
                                  color: AppColors.themeColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  "${provider.events[0]
                                      .distance}  ${getTranslated(
                                      context, "km")}",
                                  style: AppTextStyle.montserrat(
                                      AppColors.themeColor,
                                      Get.width * 0.035,
                                      FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.width * 0.01,
                          ),
                          Text(
                            provider.events[0].description ?? "",
                            style: AppTextStyle.montserrat(AppColors.lightGrey,
                                Get.width * 0.035, FontWeight.w400),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: Get.width * 0.04,
                          ),
                          Row(
                            children: [
                              Text(
                                getTranslated(context, widget.index!=2?'my_crew':"joined") ?? '',
                                style: AppTextStyle.montserrat(AppColors.black,
                                    Get.width * 0.04, FontWeight.w700),
                              ),
                              Spacer(),
                              Stack(
                                children: [
                                  CrewMembersWidget(
                                      margin: 0, image: AppImages.crew1),
                                  CrewMembersWidget(
                                      margin: 25, image: AppImages.crew2),
                                  Container(
                                      margin:
                                      EdgeInsets.only(left: 50, top: 5),
                                      decoration: BoxDecoration(
                                          color: AppColors.coalGrey,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: AppColors.whiteColor)),
                                      height: 35,
                                      width: 35,
                                      child: Center(
                                        child: Text(
                                          "+${provider.events[0].maxFriends}",
                                          style: AppTextStyle.montserrat(
                                              AppColors.whiteColor,
                                              Get.width * 0.04,
                                              FontWeight.w500),
                                        ),
                                      )),
                                ],
                              ),
                              Text(
                                  "${provider.events[0]
                                      .withFriends}${getTranslated(
                                      context, 'of')} ${provider.events[0]
                                      .maxFriends} ${getTranslated(
                                      context, "friends")} "),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.width * 0.05,
                  ),
                  widget.index != 2
                      ? AppButton(
                      buttonText: widget.index == 0
                          ? 'view_request'
                          : "view_tickets",
                      onpressed: () {
                        widget.index == 0
                            ? Get.to(() => Profiles())
                            : Get.dialog(TicketDialogBox());
                      },
                      width: Get.width,
                      isWhite: true)
                      : SizedBox(),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: Get.height * 0.2,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.black.withOpacity(0.1), offset: const Offset(0, 1.5), blurRadius: 5.0)
                          ],
                            // border: Border.all(color: AppColors.themColor)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: DrawMapRoute(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 12),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            getTranslated(context, 'route') ?? "",
                            style: AppTextStyle.montserrat(
                              AppColors.blackDark,
                              Get.width * 0.06,
                              FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: widget.index != 1
              ? Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: AppButton(
                buttonText: widget.index == 0 ? 'edit2' : 'pending3',
                onpressed: () {
                  Get.to(() =>
                      CreateEvent(
                        comingFromEdit: true,
                        editEventModel: provider.events[0],
                      ));
                },
                width: Get.width,
                isWhite: widget.index != 2 ? false : true),
          )
              : const SizedBox(),
        );
      },
    );
  }

  void pickFile(DashboardProvider provider) {
    final services = getFile();
    services.pickSingleFile().then((value) {
      setState(() {
        provider.events[0].stories.add(value);
        provider.update();
      });
    }
    );
  }
}