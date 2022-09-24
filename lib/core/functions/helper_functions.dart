// ignore_for_file: file_names
import 'dart:convert';
import 'dart:developer';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yalla_delivery/features/auth/data/models/driver_Login_model.dart';
import 'package:yalla_delivery/features/auth/domain/entities/driver_login.dart';
import '../../features/my_Profile/data/models/driver_model.dart';
import '../../features/my_Profile/domain/entities/driver.dart';
import '../../service_locator.dart';
import '../utils/constants.dart';

class HelperFunctions {
  static String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  static Future<T?> errorBar<T>(
    BuildContext context, {
    String? title,
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Flash(
            behavior: FlashBehavior.fixed,
            controller: controller,
            horizontalDismissDirection: HorizontalDismissDirection.horizontal,
            backgroundColor: Colors.black87,
            child: FlashBar(
              title: title == null
                  ? null
                  : Text('login', style: _titleStyle(context, Colors.white)),
              content:
                  Text(message, style: _contentStyle(context, Colors.white)),
              icon: Icon(Icons.warning, color: Colors.red[300]),
              indicatorColor: Colors.red[300],
            ),
          ),
        );
      },
    );
  }

  static Future<T?> successBar<T>(
    BuildContext context, {
    String? title,
    required String message,
    Duration duration = const Duration(seconds: 2),
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Flash(
            behavior: FlashBehavior.fixed,
            alignment: Alignment.bottomCenter,
            controller: controller,
            horizontalDismissDirection: HorizontalDismissDirection.horizontal,
            backgroundColor: Colors.black87,
            child: FlashBar(
              title: title == null
                  ? null
                  : Text('login', style: _titleStyle(context, Colors.white)),
              content:
                  Text(message, style: _contentStyle(context, Colors.white)),
              icon: Icon(Icons.check, color: Colors.green[300]),
              indicatorColor: Colors.green[300],
            ),
          ),
        );
      },
    );
  }

  static Driver? getDriver() {
    SharedPreferences sharedPreferences = sl<SharedPreferences>();
    String? driverString = sharedPreferences.getString(kcashedUserData);
    Map<String, dynamic> json = jsonDecode(driverString!);
    return DriverModel.fromMap(json);
  }

  static saveDriver(DriverModel driver) async {
    SharedPreferences sharedPreferences = sl<SharedPreferences>();
    await sharedPreferences.setString(
        kcashedUserData, json.encode(driver.toMap()));
  }

  // static Future saveFirstTime() async {
  //   await GetStorage.init().then((value) {
  //     GetStorage().write(kIsFirstTime, false);
  //   });
  // }

  static Future saveLang(String? lang) async {
    await GetStorage.init().then((value) {
      GetStorage().write(klanguage, lang);
    });
  }

  // static Future saveApplicationInformation(String name, String value) async {
  //   await GetStorage.init().then((value) {
  //     GetStorage().write(storageKey + name, value);
  //   });
  // }

  // static Driver? getUser() {
  //   return DriverModel.fromMap(
  //     GetStorage().read(kcashedUserData),
  //   );
  // }

  // static Future saveUser(Driver data) async {
  //   await GetStorage.init().then((value) {
  //     GetStorage().write(kcashedUserData, data);
  //     GetStorage().write(kIsLoggedIn, true);

  //     log('IsLoggedIn >>> ${GetStorage().read(kIsLoggedIn)}');
  //     log(('cashedUserData >>> ${GetStorage().read(kcashedUserData)}'));
  //   });
  // }
}

TextStyle _titleStyle(BuildContext context, [Color? color]) {
  var theme = Theme.of(context);
  return (theme.dialogTheme.titleTextStyle ?? theme.textTheme.headline6)!
      .copyWith(color: color);
}

TextStyle _contentStyle(BuildContext context, [Color? color]) {
  var theme = Theme.of(context);
  return (theme.dialogTheme.contentTextStyle ?? theme.textTheme.bodyText2)!
      .copyWith(color: color);
}


// static String? getDriverid() {
//     SharedPreferences sharedPreferences = sl<SharedPreferences>();
    
//     return sharedPreferences.getString(kcashedUserData);
//   }

//   static saveDriverId(String driverId) async {
//     SharedPreferences sharedPreferences = sl<SharedPreferences>();
//     await sharedPreferences.setString(kcashedUserData, driverId);
//   }
