import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_delivery/features/auth/presentation/pages/login.dart';
import 'package:yalla_delivery/features/my_Profile/presentation/pages/change_password_screen.dart';
import 'package:yalla_delivery/features/my_Profile/presentation/pages/my_profile_screen.dart';

import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../service_locator.dart';

class AppRoutes {
  static const String spalashScreen = '/';
  static const String loginScreen = '/loginScreen';
  static const String signUpScrreen = '/signUpScrreen';
  static const String myprofileScreen = '/myprofileScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
}

class Routes {
  static Route? onGenetatearoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case AppRoutes.spalashScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const SpalshScreen(),
      //   );

      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );

      case AppRoutes.myprofileScreen:
        return MaterialPageRoute(
          builder: (context) => MyProfileScreen(),
        );

      case AppRoutes.changePasswordScreen:
        return MaterialPageRoute(
          builder: (context) => ChangePasswordScreen(),
        );

      default:
        return null;
    }
  }
}
