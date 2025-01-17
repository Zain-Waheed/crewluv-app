import 'dart:async';

import 'package:amigos/helpers/bottom_sheets/filters_bottomsheet.dart';
import 'package:amigos/helpers/widgets/mood_wideget.dart';
import 'package:amigos/helpers/widgets/nointernet_screen.dart';
import 'package:amigos/helpers/widgets/ticket_dialog.dart';
import 'package:amigos/localization/app_localization.dart';
import 'package:amigos/providers/auth_provider.dart';
import 'package:amigos/providers/dashboard_provider.dart';
import 'package:amigos/test_room.dart';
import 'package:amigos/ui/auth/complete_profile_screen.dart';
import 'package:amigos/ui/auth/enter_dob.dart';
import 'package:amigos/ui/auth/media_profile_screen.dart';
import 'package:amigos/ui/auth/otp_screen.dart';
import 'package:amigos/ui/auth/phone_screen.dart';
import 'package:amigos/ui/dashboard/all_events.dart';
import 'package:amigos/ui/dashboard/chat_details.dart';
import 'package:amigos/ui/dashboard/chat_screen.dart';
import 'package:amigos/ui/dashboard/dashboard.dart';
import 'package:amigos/ui/dashboard/edit_profile.dart';
import 'package:amigos/ui/dashboard/event_details.dart';
import 'package:amigos/ui/dashboard/faqs.dart';
import 'package:amigos/ui/dashboard/group_chat_screen.dart';
import 'package:amigos/ui/dashboard/home_screen.dart';
import 'package:amigos/ui/dashboard/profile_screen.dart';
import 'package:amigos/ui/dashboard/profiles_screen.dart';
import 'package:amigos/ui/dashboard/sample_dashboard.dart';
import 'package:amigos/ui/dashboard/settings_screen.dart';
import 'package:amigos/ui/intro/onboarding.dart';
import 'package:amigos/ui/intro/splash_logo_screen.dart';
import 'package:amigos/ui/intro/splash_screen.dart';
import 'package:amigos/ui/intro/white_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'helpers/widgets/getplan_dialog.dart';

bool isLoggedIn = false;

Future<void> main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => (DashboardProvider())),
    ChangeNotifierProvider(create: (_) => (AuthProvider())),
  ], child: MyApp()
  )
  );
}
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch.cast());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: unused_field
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  Locale? _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result=ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      // print(e.toString());
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        {

        }
        break;
      case ConnectivityResult.mobile:
        {

        }
        break;
      case ConnectivityResult.none:
        {
          Get.snackbar("Uh Oh!", "No Internet Connection");
          Get.to(() => const NoInternetScreen());
        }
        setState(() => _connectionStatus = result.toString());
        break;
      default:

        break;
    }

  }

  void startConnectionStream() {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    super.dispose();
    connectivitySubscription.cancel();
  }
  @override
  void initState() {
    startConnectionStream();
    setLocale(const Locale("en"));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return GetMaterialApp(
      locale: _locale,
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      localeResolutionCallback:
          (Locale? deviceLocale, Iterable<Locale> supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale!.languageCode &&
              locale.countryCode == deviceLocale.countryCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      title: 'amigos',
       home: DashBoard(),
    );
  }
}