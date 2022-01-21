// import 'dart:async';
// import 'dart:typed_data';
// import 'dart:ui'as ui;
// import 'package:amigos/utils/images.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
//
// class LocationTraking extends StatefulWidget {
//   const LocationTraking({Key? key}) : super(key: key);
//
//   @override
//   _LocationTrakingState createState() => _LocationTrakingState();
// }
//
// class _LocationTrakingState extends State<LocationTraking> {
//   BitmapDescriptor? icon1;
//   BitmapDescriptor? icon2;
//   LatLng sourceLocation= LatLng(31.4564555, 74.2852029);
//   LatLng destinationLatlng= LatLng(31.4575, 74.2797);
//
//    bool isLoading=false;
//   Completer<GoogleMapController> _controller=Completer();
//
//   Set<Marker> _marker=Set<Marker>();
//   Set<Polyline> _polylines=Set<Polyline>();
//   List<LatLng> polylineCoordinates=[];
//   late PolylinePoints polylinePoints;
//
//   late StreamSubscription<LocationData> subscription;
//   late LocationData currentLocation;
//   late LocationData destinationLocation;
//   late Location location;
//   static Future<Uint8List> getBytesFromAsset(String path, int width) async {
//     ByteData data = await rootBundle.load(path);
//     ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
//         targetWidth: width);
//     ui.FrameInfo fi = await codec.getNextFrame();
//     return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
//         .buffer
//         .asUint8List();
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance!.addPostFrameCallback((_) async {
//       await getBytesFromAsset(AppImages.clubLocation, 84).then((onValue) {
//         icon1 = BitmapDescriptor.fromBytes(onValue);
//         setState(() {});
//       });
//       //
//       await getBytesFromAsset(AppImages.fireLocation, 150).then((onValue) {
//         icon2 = BitmapDescriptor.fromBytes(onValue);
//         setState(() {});
//       });
//     });
//     location=Location();
//     polylinePoints=PolylinePoints();
//    subscription=location.onLocationChanged.listen((cLocation) {
//       currentLocation=cLocation;
//
//       updatePinsOnMap();
//     });
//     setInitialLocation();
//   }
//
//
//   void setInitialLocation() async{
//     currentLocation=await location.getLocation();
//     destinationLocation=LocationData.fromMap({
//       "latitude": destinationLatlng.latitude,
//       "longitude": destinationLatlng.longitude,
//     });
//   }
//
//   showLocationPins(){
//     var sourcePosition=LatLng(currentLocation.latitude??0.0, currentLocation.latitude??0.0);
//
//     var  destinationPosition=LatLng(destinationLatlng.latitude, destinationLatlng.latitude);
//     _marker.add(Marker(
//       markerId: MarkerId('sourcePosition'),
//       position: sourcePosition,
//       icon: icon1!,
//     ));
//
//     _marker.add(Marker(
//       markerId: MarkerId('sourcePosition'),
//       position: destinationPosition,
//       icon: icon2!,
//     ));
//
//     setPolylinesInMap();
//   }
//
//   void setPolylinesInMap()async {
//     var result= await polylinePoints.getRouteBetweenCoordinates(
//         "AIzaSyCUsgLTPFck90L3IB9l_CcTPLy4H5Lnwus",
//         PointLatLng(currentLocation.latitude??0.0,currentLocation.longitude??0.0),
//         PointLatLng(destinationLatlng.latitude, destinationLatlng.latitude),
//     );
//     print( result.points.length.toString()+"fchchgcm===================================bhbbvjbvjhbvjhbvjhv");
//     if(result.points.isNotEmpty){
//       result.points.forEach((pointLatLng) {
//         polylineCoordinates.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
//       });
//     }
//     setState(() {
//       _polylines.add(Polyline(
//         width: 10,
//         polylineId: PolylineId('polyline'),
//         color: Colors.blueAccent,
//         points: polylineCoordinates,
//       ));
//     });
//   }
//
//
//   updatePinsOnMap() async {
//     CameraPosition cameraPosition=CameraPosition(
//       zoom:20,
//         tilt:80,
//         bearing:30,
//         target: LatLng(
//             currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
//     );
//
//     final GoogleMapController controller = await _controller.future;
//
//     controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//
//     var sourcePosition = LatLng(
//         currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);
//
//     setState(() {
//       _marker.removeWhere((marker) => marker.mapsId.value == 'sourcePosition');
//
//       _marker.add(Marker(
//         markerId: MarkerId('sourcePosition'),
//         position: sourcePosition,
//       ));
//     });
//
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     CameraPosition initialCameraPosition=CameraPosition(
//         target: sourceLocation,
//       zoom: 20,
//       tilt: 80,
//       bearing: 30,
//     );
//     return SafeArea(
//         child:Scaffold(
//           body: GoogleMap(
//             initialCameraPosition: initialCameraPosition,
//             myLocationButtonEnabled: true,
//             markers: _marker,
//             polylines: _polylines,
//             mapType: MapType.normal,
//             onMapCreated: (GoogleMapController controller){
//               _controller.complete(controller);
//
//               showLocationPins();
//             },
//           ),
//     ));
//   }
//
//   @override
//   void dispose() {
//     subscription.cancel();
//     super.dispose();
//   }
// }
