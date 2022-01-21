// import 'dart:async';
// import 'package:amigos/localization/app_localization.dart';
// import 'package:amigos/utils/colors.dart';
// import 'package:amigos/utils/text_styles.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
//
//
// class NoInternetScreen extends StatefulWidget {
//   const NoInternetScreen({required Key key}) : super(key: key);
//
//   @override
//   _NoInternetScreenState createState() => _NoInternetScreenState();
// }
//
// class _NoInternetScreenState extends State<NoInternetScreen> {
//   bool isChecking = false;
//   String _connectionStatus = 'Unknown';
//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;
//
//   Future<void> initConnectivity() async {
//     ConnectivityResult result;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       setState(() {
//         isChecking = true;
//       });
//       result = await _connectivity.checkConnectivity();
//       setState(() {
//         isChecking = false;
//       });
//     } on PlatformException catch (e) {
//       print(e.toString());
//     }
//
//     if (!mounted) {
//       return Future.value(null);
//     }
//
//     return _updateConnectionStatus(result);
//   }
//
//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     switch (result) {
//       case ConnectivityResult.wifi:
//         {
//           Get.back();
//           Get.snackbar(getTranslated(context, "hurray")??"",
//               getTranslated(context, "connection_restored")??"");
//         }
//         break;
//       case ConnectivityResult.mobile:
//         {
//           Get.back();
//           Get.snackbar(getTranslated(context, "hurray")??"", getTranslated(context, "connection_restored")??"");
//         }
//         break;
//       case ConnectivityResult.none:
//         Get.snackbar(getTranslated(context, "uh_oh")??"",
//             getTranslated(context, "no_internet_connection")??"");
//
//         break;
//     // setState(() => _connectionStatus = result.toString());
//     // break;
//       default:
//         setState(() => _connectionStatus = 'Failed to get connectivity.');
//         break;
//     }
//     print(result);
//     print(_connectionStatus);
//   }
//
//   void startConnectionStream() {
//     _connectivitySubscription =
//         _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }
//
//   Future<bool> checkBeforeGoingBack() async {
//     ConnectivityResult result;
//     result = await _connectivity.checkConnectivity();
//     if (result == ConnectivityResult.mobile ||
//         result == ConnectivityResult.wifi) {
//       return Future.value(true);
//     } else {
//       return Future.value(false);
//     }
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _connectivitySubscription.cancel();
//   }
//
//   @override
//   void initState() {
//     initConnectivity();
//     startConnectionStream();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: checkBeforeGoingBack,
//       child: Scaffold(
//         backgroundColor: Colors.white.withOpacity(0.5),
//         body: Container(
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(10)),
//           margin: EdgeInsets.symmetric(
//               vertical: Get.height*0.27, horizontal: Get.width*0.08),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   noInternetWidget(scale: 1.5),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
//                     //  alignment: Alignment.topCenter,
//                     width: Get.width,
//                     child: Text(
//                       "No Internet Connection",
//                       style: TextStyle(
//                           fontSize: Get.width * 0.045,
//                           fontFamily: 'monts',
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//
//                 height: Get.height * 0.02,
//               ),
//               isChecking
//                   ? const SizedBox(
//
//                 height: 50,
//                 width: 50,
//                 child: CircularProgressIndicator(),
//               )
//                   : _retryButton(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _retryButton() {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
//             child: GestureDetector(
//               onTap: () {
//                 initConnectivity();
//               },
//               child: ElevatedButton(
//                 onPressed: () {
//                   initConnectivity();
//                 },
//                 child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
//                     child: Text("Retry", style: AppTextStyle.montserrat(
//                         AppColors.black,
//                         Get.width*0.04,
//                         FontWeight.w500,
//                     )
//                     )),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget noInternetWidget({required double scale}) {
//     return const Icon(
//       Icons.warning_rounded,
//       color: Colors.blue,
//       size: 100,
//     );
//     /* Center(
//         child: Image.asset(
//       AppImages.messageImage,
//       scale: scale,
//     ));*/
//   }
// }