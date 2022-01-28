import 'dart:async';

import 'package:amigos/helpers/widgets/app_button.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';

class AddPropertyLocationScreen extends StatefulWidget {
  @override
  _AddPropertyLocationScreenState createState() =>
      _AddPropertyLocationScreenState();
}

class _AddPropertyLocationScreenState extends State<AddPropertyLocationScreen> {
  TextEditingController searchController = TextEditingController();

  List<Marker> myMarker = [];
  static const kGoogleApiKey = "AIzaSyCUsgLTPFck90L3IB9l_CcTPLy4H5Lnwus";
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

  final Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  LatLng?  addressPoints;

  void _add() {
    const MarkerId markerId = MarkerId("123");

    const Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        37.42796133580664,
        -122.085749655962,
      ),
    );
    markers.addAll({markerId: marker});
  }

  @override
  void initState() {
    _add();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          flexibleSpace: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: AppInputDecoration.circularFieldDecoration(null, 'search_location', Icon(Icons.search),),
                      readOnly: true,
                      onTap: () {
                        // searchLocation();
                        _placePickerFunc();
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Image.asset(
                      AppImages.cross,
                      height: Get.height * 0.045,
                      width: Get.width * 0.06,
                    ),
                  ),
                ],
              ),
            ),
          ),
          leading: null,
          backgroundColor: AppColors.whiteColor,
        ),
        body: SafeArea(
          bottom: false,
          top: true,
          child: Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                zoomControlsEnabled: true,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                    target: LatLng(
                        provider.currentPosition?.latitude ?? 37.42796133580664,
                        provider.currentPosition?.longitude ?? -122.085749655962),
                    zoom: 14.4746),
                markers: Set<Marker>.of(myMarker),
                onTap: _addMarkerFunc,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width * 0.7,
                  height: Get.height * 0.07,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: AppButton(
                    onpressed: (){
                      Get.back(result: addressPoints);
                    }, buttonText: 'select', isWhite: false, width: Get.width*0.1,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Future<void> _placePickerFunc() async {
    Prediction? p = await PlacesAutocomplete.show(
      radius: 1000,
      strictbounds: false,
      language: "en",
      context: context,
      types: [],
      onError: onError,
      mode: Mode.overlay,
      apiKey: kGoogleApiKey,
      components: [
        // Component(Component.country, "se"),
      ],
      hint: "Search Here",
    );

    p = await displayPrediction(p!);
  }

  // convert prediction latlng to address
  Future<Prediction> displayPrediction(
      Prediction p,
      ) async {
    if (p != null) {
      PlacesDetailsResponse detail =
      await _places.getDetailsByPlaceId(p.placeId ?? "");
      final lat = detail.result.geometry?.location.lat;
      final lng = detail.result.geometry?.location.lng;
      var cont = await _controller.future;
      cont.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(lat!, lng!),
            zoom: 15.0,
          ),
        ),
      );
      _addMarkerFunc(LatLng(lat, lng));
    }
    searchController.text = p.description ?? "";
    return p;
  }

  // add marker function
  _addMarkerFunc(LatLng tappedPoint) {
    // getLocAddress(tappedPoint);
    setState(() {
      myMarker = [];
      myMarker.add(Marker(
          markerId: MarkerId(tappedPoint.toString()), position: tappedPoint));
      addressPoints=tappedPoint;
    });
  }

  // place Predictor error function
  void onError(PlacesAutocompleteResponse response) {
    Get.snackbar("Error", response.errorMessage ?? "",);
  }

}
