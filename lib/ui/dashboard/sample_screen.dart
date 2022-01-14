// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class PloyLineMap extends StatefulWidget {
//   const PloyLineMap({Key? key}) : super(key: key);
//
//   @override
//   _PloyLineMapState createState() => _PloyLineMapState();
// }
//
// class _PloyLineMapState extends State<PloyLineMap> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         myLocationButtonEnabled: true,
//         compassEnabled: true,
//         markers: _marker,
//         polylines: _polylines,
//         mapType: MapType.normal,
//         initialCameraPosition: initialCameraPosition,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//
//           showLocationPins();
//         },
//       ),
//     );
//   }
// }
//
//
