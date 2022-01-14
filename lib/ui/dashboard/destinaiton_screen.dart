import 'dart:developer';
import 'dart:typed_data';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/utils/colors.dart';
import 'package:amigos/utils/images.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart' as loc;
import 'dart:ui'as ui;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';



class DrawMapRoute extends StatefulWidget {
  const DrawMapRoute({Key? key}) : super(key: key);

  @override
  _DrawMapRouteState createState() => _DrawMapRouteState();
}

class _DrawMapRouteState extends State<DrawMapRoute> {
  BitmapDescriptor? icon1;
  BitmapDescriptor? icon2;
  bool? isLoading = true;
  final CameraPosition _initialLocation = const CameraPosition(target: LatLng(31.4564555, 74.2852029));
  late GoogleMapController mapController;
  loc.Location location = loc.Location();
  Position? _currentPosition;
  Set<Marker> markers = {};
  List<LatLng> polylineCoordinates =[ LatLng(31.4564555, 74.2852029), LatLng(31.4564785, 74.28527829)];

  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        log('CURRENT POS: $_currentPosition!');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 15,
            ),
          ),
        );
      });
    }).catchError((e) {
      log(e);
    });
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

  Set<Marker> getmarkers(/*LatLng tappedPoint*/DashboardProvider provider) {
    // getLocAddress(tappedPoint);
    markers.add(Marker(
      //add second marker
      markerId: MarkerId("1"),
      position: LatLng(_currentPosition!.latitude,  _currentPosition!.longitude),//position of marker
      onTap: (){
      },
      icon: icon1!, //Icon for Marker
    ));
    markers.add(Marker(
      //add second marker
      markerId: MarkerId("2"),
      position: LatLng(31.4574555, 74.2752029),//position of marker
      onTap: (){
      },
      icon: icon2!, //Icon for Marker
    ));
    return markers;
  }

  late PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  _addPolyLine() {
    PolylineId id = PolylineId("${polylineCoordinates.first}");
    Polyline polyline = Polyline(
        width: 5,
        polylineId: id,
        color: AppColors.blue,
        points: polylineCoordinates);
    // polylines[id] = polyline;
    print("polyline added");
    // notifyListeners();
  }
  createRoute(double lat1, double lng1, double lat2, double lng2) async {
    print("in poly method");
    polylines.clear();
    polylineCoordinates = [];
    PolylineResult result;
    polylinePoints = PolylinePoints();
    result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyCUsgLTPFck90L3IB9l_CcTPLy4H5Lnwus',
      PointLatLng(lat1, lng1),
      PointLatLng(lat2, lng2),
      travelMode: TravelMode.driving,
    );
    print(
        "api result status ${result.status} :::: error ${result
            .errorMessage}  \n points ${result.points} \n ${result
            .errorMessage}");
    if (result.points.isNotEmpty) {
      print("poly points created");
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      await _addPolyLine();

      // notifyListeners();
    }
  }

  @override
  void initState() {
    _getCurrentLocation();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await getBytesFromAsset(AppImages.location, 84).then((onValue) {
        icon1 = BitmapDescriptor.fromBytes(onValue);
        setState(() {});
        isLoading = false;
      });
      await getBytesFromAsset(AppImages.clubLocation, 84).then((onValue) {
        icon2 = BitmapDescriptor.fromBytes(onValue);
        setState(() {});
        isLoading = false;
      });
    });
    createRoute(31.4564555, 74.2852029,31.4574555, 74.2752029);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
    Consumer<DashboardProvider>(builder:(context,provider,_){
      return Scaffold(
        body: isLoading==true? SizedBox() :GoogleMap(
          polylines: Set<Polyline>.of(polylines.values),
          markers: getmarkers(provider),
          initialCameraPosition: _initialLocation,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          mapType: MapType.normal,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
          },
          onTap: (latLng) {
          },
        ),
      );
    });
  }
}
