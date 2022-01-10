import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialLocation,
        zoomControlsEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        onMapCreated: _onMapCreated,

        // markers: Set.from(myMarker),
        markers: getmarkers(),

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
