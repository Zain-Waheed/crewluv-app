import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui'as ui;
import 'package:amigos/helpers/bottom_sheets/filters_bottomsheet.dart';
import 'package:amigos/helpers/widgets/event_widget.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  BitmapDescriptor? icon1;
  BitmapDescriptor? icon2;
  BitmapDescriptor? icon3;
  BitmapDescriptor? icon4;
  bool? isLoading = true;

  final CameraPosition _initialLocation =const CameraPosition(
    target:LatLng(  37.42796133580764,-122.085749655962 ),
    zoom: 14.4746,
  );
  // const CameraPosition(target: LatLng(0.0, 0.0));
  Completer<GoogleMapController> mapController = Completer();
  final Set<Marker> markers = Set();
  Set<Marker> getmarkers(/*LatLng tappedPoint*/DashboardProvider provider) {
    // getLocAddress(tappedPoint);
    markers.add(Marker(
      //add second marker
        markerId: MarkerId("1"),
        position: LatLng(  37.42796133580764,-122.085749655962 ),//position of marker
        onTap: (){
          Get.dialog(
              EventWidget(user: provider.users.first, event: provider.events[0])
          );
        },
        icon: icon1!, //Icon for Marker
    ));
    markers.add(Marker(
      //add second marker
      markerId: MarkerId("2"),
      position: LatLng(  37.42596133580764,-122.085749655962 ),//position of marker
      onTap: (){
        Get.dialog(
            EventWidget(user: provider.users.first, event: provider.events[0])
        );
      },
      icon: icon2!,
      //Icon for Marker


    ));
    markers.add(Marker(
      //add second marker
      markerId: MarkerId("3"),
      position: LatLng(  37.43396133580764,-122.086749655962 ),//position of marker
      onTap: (){
        Get.dialog(
            EventWidget(user: provider.users.first, event: provider.events[0])
        );
      },
      icon: icon3!, //Icon for Marker
    ));
    markers.add(Marker(
      //add second marker
      markerId: MarkerId("4"),
      position: LatLng(  37.42796133580764,-122.087749655962 ),//position of marker
      onTap: (){
        Get.dialog(
            EventWidget(user: provider.users.first, event: provider.events[0])
        );
      },
      icon: icon4!, //Icon for Marker
    ));
    return markers;
  }


  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await getBytesFromAsset(AppImages.clubLocation, 84).then((onValue) {
        icon1 = BitmapDescriptor.fromBytes(onValue);
        setState(() {});
      });
      //
      await getBytesFromAsset(AppImages.fireLocation, 150).then((onValue) {
        icon2 = BitmapDescriptor.fromBytes(onValue);
        setState(() {});
      });
      await getBytesFromAsset(AppImages.giftLocation, 150).then((onValue) {
        icon3 = BitmapDescriptor.fromBytes(onValue);
        setState(() {});
      });
      await getBytesFromAsset(AppImages.bollonLocation, 150).then((onValue) {
        icon4 = BitmapDescriptor.fromBytes(onValue);
        isLoading = false;
        setState(() {});
      });


    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context , provider , _){
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding:  EdgeInsets.only(top:Get.height*0.15,),
          child: FloatingActionButton.extended(
            backgroundColor: AppColors.whiteBackground,
            onPressed: () {
              Get.bottomSheet(
                FiltersBottomSheet(), isScrollControlled: true,
              );
            },
            label: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getTranslated(context, 'filter')??"",
                  style: AppTextStyle.montserrat(
                      AppColors.black, Get.width*0.04, FontWeight.w700
                  ),
                ),
                SizedBox(
                  width: Get.width*0.02,
                ),
                Image.asset(AppImages.filter,),
              ],
            ),
          ),
        ),
        body: isLoading==true? SizedBox() : GoogleMap(
          initialCameraPosition: _initialLocation,
          zoomControlsEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          mapType: MapType.normal,
          zoomGesturesEnabled: true,
          onMapCreated: _onMapCreated,

          // markers: Set.from(myMarker),
          markers: getmarkers(provider),

          // {
          //
          //   Set.from(myMarker)
          // },
          // onTap: getmarkers,
        ),

      );
    });
  }

  _onMapCreated(GoogleMapController controller) {
    mapController.complete( controller);
  }
}
