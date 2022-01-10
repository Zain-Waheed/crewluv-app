import 'dart:async';

import 'package:amigos/helpers/bottom_sheets/filters_bottomsheet.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late BitmapDescriptor customIcon;
  final CameraPosition _initialLocation =const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  // const CameraPosition(target: LatLng(0.0, 0.0));
  Completer<GoogleMapController> mapController = Completer();
  final Set<Marker> markers = Set();
  Set<Marker> getmarkers(/*LatLng tappedPoint*/) {
    // getLocAddress(tappedPoint);
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(_initialLocation.toString()),
        position: LatLng(37.42796133580670,-122.085749655965 ), //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Marker 12',
          snippet: 'Snippet marker Hussnain',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        //add second marker
        markerId: MarkerId(_initialLocation.toString()),
        position: LatLng(37.42796133580660,-122.085749655965 ), //position of marker
        infoWindow: const InfoWindow(
          title: 'Marker 23 ',
          snippet: ' Subtitle !@#',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

    });

    setState(() {});

    return markers;
  }

   customMarker() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration(),'assets/images/filled_circle.png').
    then((value) => {
      customIcon = value
    });
  }
  @override
  void initState() {

    customMarker();
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding:  EdgeInsets.only(top:Get.width*0.2,),
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
                    AppColors.blackLite, Get.width*0.04, FontWeight.w700
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
      body: GoogleMap(
        initialCameraPosition: _initialLocation,
        zoomControlsEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        onMapCreated: _onMapCreated,

        // markers: Set.from(customMarker),
        // markers: getmarkers(),

        // {
        //
        //   Set.from(myMarker)
        // },
        // onTap: getmarkers,
      ),

    );
  }

  _onMapCreated(GoogleMapController controller) {
    mapController.complete( controller);
  }
}
