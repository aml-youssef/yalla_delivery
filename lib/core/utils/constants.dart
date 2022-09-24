import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../config/themes/screen_utitlity.dart';



const kAppLogog = 'assets/images/splash.png';
const kmapIcon = 'assets/images/delivery_icon.png';

ValueNotifier<Locale> locale = ValueNotifier(const Locale('en', 'US'));

///////////////////////////////////////////////////////////
/// theme
///////////////////////////////////////////////////////////

ThemeData appTheme = ThemeData(
  appBarTheme: appBarTheme,
  primaryColor: MainStyle.primaryColor,
  fontFamily: 'Cairo',
  backgroundColor: Colors.grey[300],
  iconTheme: const IconThemeData(color: MainStyle.selectedIconColor),
);

AppBarTheme appBarTheme = const AppBarTheme(
    color: MainStyle.primaryColor,
    iconTheme: IconThemeData(color: MainStyle.selectedIconColor),
    elevation: 0.0,
    titleTextStyle: TextStyle(color: MainStyle.selectedIconColor));

///////////////////////////////////////////////////////////
/// Text Style
///////////////////////////////////////////////////////////

const String kMessage = 'message';
const String kExceptionMessage = 'There was an error please try again later';
const String kIsLoggedIn = 'logged in';
const String kToken = 'token';
const String kIsFirstTime = 'FirstTime';
const String storageKey = 'MyApplication_';
const String klanguage = 'language';
const String kcashedUserData = 'userData';
const Duration kDuration = Duration(milliseconds: 500);
const LatLng defaultLatLng = LatLng(30.033333, 31.233334);
const googleMapAPIKey = 'AIzaSyDpI-Txo3DNdts1guCpNTiaKofVYJXKGcE'; ////android manfist  ////polylines
const double defaultMapZoom = 17.0;
const double mediumMapZoom = 14.0;
const double locationArriveDistance = 200.0; //i
const int locationChangeInterval = 5000; //in milliseconds
const double locationChangeDistance = 5.0; //in meters
