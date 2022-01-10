import 'dart:async';
import 'package:amigos/helpers/bottom_sheets/filters_bottomsheet.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:amigos/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MaoScreen extends StatefulWidget {
  const MaoScreen({Key? key}) : super(key: key);

  @override
  _MaoScreenState createState() => _MaoScreenState();
}

class _MaoScreenState extends State<MaoScreen> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  final Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

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
    return   Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding:  EdgeInsets.only(top:Get.width*0.2,),
        child: FloatingActionButton.extended(
          backgroundColor: AppColors.whiteBackground,
          onPressed: () {
            Get.bottomSheet(
              const FiltersBottomSheet(), isScrollControlled: true,
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
              Image.asset(AppImages.filter,scale:3,),
              Image.asset(AppImages.filter,),
            ],
          ),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(markers.values),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
