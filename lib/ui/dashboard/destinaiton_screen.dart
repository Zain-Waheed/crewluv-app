import 'dart:developer';
import 'package:location/location.dart' as loc;
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show cos, sqrt, asin;



class DrawMapRoute extends StatefulWidget {
  const DrawMapRoute({Key? key}) : super(key: key);

  @override
  _DrawMapRouteState createState() => _DrawMapRouteState();
}

class _DrawMapRouteState extends State<DrawMapRoute> {
  final CameraPosition _initialLocation =
  const CameraPosition(target: LatLng(31.4564555, 74.2852029));
  late GoogleMapController mapController;

  loc.Location location = loc.Location();
  TextEditingController locationSearchController = TextEditingController();

  Position? _currentPosition;
  String _currentAddress = 'Johar Town';

  // final startAddressController = TextEditingController();
  // final destinationAddressController = TextEditingController();

  // final startAddressFocusNode = FocusNode();
  // final destinationAddressFocusNode = FocusNode();

  String _startAddress = 'Johar Town';
  String _destinationAddress = 'Faisal Town';
  String? _placeDistance;

  Set<Marker> markers = {};

  late PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates =[ LatLng(31.4564555, 74.2852029), LatLng(31.4564785, 74.28527829)];

  final _scaffoldKey = GlobalKey<ScaffoldState>();
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
      await _getAddress();
    }).catchError((e) {
      log(e);
    });
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      // Places are retrieved using the coordinates
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      // Taking the most probable result
      Placemark place = p[0];

      setState(() {
        // Structuring the address
        _currentAddress =
        "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";

        _startAddress = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }

  // Method for calculating the distance between two places
  Future<bool> _calculateDistance() async {
    try {
      // Retrieving placemarks from addresses
      List<Location>? startPlacemark = await locationFromAddress(_startAddress);
      List<Location>? destinationPlacemark =
      await locationFromAddress(_destinationAddress);

      double startLatitude = _startAddress == _currentAddress
          ? _currentPosition!.latitude
          : startPlacemark[0].latitude;

      double startLongitude = _startAddress == _currentAddress
          ? _currentPosition!.longitude
          : startPlacemark[0].longitude;

      double destinationLatitude = destinationPlacemark[0].latitude;
      double destinationLongitude = destinationPlacemark[0].longitude;

      String startCoordinatesString = '($startLatitude, $startLongitude)';
      String destinationCoordinatesString =
          '($destinationLatitude, $destinationLongitude)';

      // Start Location Marker
      Marker startMarker = Marker(

        markerId: MarkerId(startCoordinatesString),
        position: LatLng(startLatitude, startLongitude),
        // position: LatLng(value.latitude, value.longitude),
        onDragEnd: ((LatLng newPosition) {
          print(newPosition.latitude);
          print(newPosition.longitude);
        }),
        infoWindow: InfoWindow(
          title: 'Start $startCoordinatesString',
          snippet: _startAddress,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(.90),
      );

      // Destination Location Marker
      Marker destinationMarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: LatLng(destinationLatitude, destinationLongitude),
        infoWindow: InfoWindow(
          title: 'Destination $destinationCoordinatesString',
          snippet: _destinationAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Adding the markers to the list
      markers.add(startMarker);
      markers.add(destinationMarker);

      log(
        'START COORDINATES: ($startLatitude, $startLongitude)',
      );
      log(
        'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
      );

      // Calculating to check that the position relative
      // to the frame, and pan & zoom the camera accordingly.
      double miny = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;
      double minx = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;
      double maxy = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;
      double maxx = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;

      double southWestLatitude = miny;
      double southWestLongitude = minx;

      double northEastLatitude = maxy;
      double northEastLongitude = maxx;

      // Accommodate the two locations within the
      // camera view of the map
      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: LatLng(northEastLatitude, northEastLongitude),
            southwest: LatLng(southWestLatitude, southWestLongitude),
          ),
          100.0,
        ),
      );

      await _createPolylines(startLatitude, startLongitude, destinationLatitude,
          destinationLongitude);

      double totalDistance = 0.0;
      for (int i = 0; i < polylineCoordinates.length - 1; i++) {
        totalDistance += _coordinateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude,
        );
      }

      setState(() {
        _placeDistance = totalDistance.toStringAsFixed(2);
        log('DISTANCE: $_placeDistance km');
      });

      return true;
    } catch (e) {
      debugPrint("$e");
    }
    return false;
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // Create the polylines for showing the route between two places
  _createPolylines(
      double startLatitude ,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude,
      ) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      // Provider.of<AppProvider>(Get.context!, listen: false)
      //     .kGoogleApiKey, // Google Maps API Key
'AIzaSyCUsgLTPFck90L3IB9l_CcTPLy4H5Lnwus',
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 6,
    );
    polylines[id] = polyline;
  }

  @override
  void initState() {
    setState(() {
      _getCurrentLocation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      width: width,
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            // Map View
            GoogleMap(
              markers: Set<Marker>.from(markers),
              polylines: Set<Polyline>.of(polylines.values),
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,

              // onCameraMove: ((_position) => _updatePosition(_position)),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              onTap: (latLng) {
                print(
                    '${latLng.latitude}, ${latLng.longitude}   ========================================================LATLNG');
                // print(
                    // "${LatLng(_currentPosition!.latitude, _currentPosition!.longitude)}========================================================LATLNG");
              },
            ),

            SafeArea(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.orange.shade100, // button color
                      child: InkWell(
                        splashColor: Colors.orange, // inkwell color
                        child: const SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(Icons.my_location),
                        ),
                        onTap: () {
                          (_startAddress != '' &&
                              _destinationAddress != '')
                              ? () async {
                            // startAddressFocusNode.unfocus();
                            // destinationAddressFocusNode.unfocus();
                            setState(() {
                              if (markers.isNotEmpty) markers.clear();
                              if (polylines.isNotEmpty) {
                                polylines.clear();
                              }
                              if (polylineCoordinates.isNotEmpty) {
                                polylineCoordinates.clear();
                              }
                              _placeDistance = null;
                            });

                            _calculateDistance().then((isCalculated) {
                              if (isCalculated) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Distance Calculated Sucessfully',
                                    ),
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Error Calculating Distance'),
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                );
                              }
                            });
                          }
                              : null;
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
