import 'package:flutter/material.dart';
import 'package:yalla_delivery/features/auth/presentation/pages/login.dart';
import 'package:yalla_delivery/features/my_Profile/presentation/pages/change_password_screen.dart';
import 'package:yalla_delivery/features/my_Profile/presentation/pages/my_profile_screen.dart';
import 'package:yalla_delivery/features/orders/presentation/pages/details_screen.dart';
import 'package:yalla_delivery/features/orders/presentation/pages/orders_screen.dart';

import '../../features/orders/presentation/pages/cancel_order_screen.dart';
import '../../features/orders/presentation/pages/follow_order_screen.dart';

class AppRoutes {
  static const String spalashScreen = '/';
  static const String loginScreen = '/loginScreen';
  static const String signUpScrreen = '/signUpScrreen';
  static const String myprofileScreen = '/myprofileScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String ordersScreen = '/OrdersScreen';
  static const String cancelOrderScreen = '/CancelOrderScreen';
  static const String followOrderScreen = '/FollowOrderScreen';
  static const String detailsScreen = '/DetailsScreen';
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

      case AppRoutes.ordersScreen:
        return MaterialPageRoute(
          builder: (context) => OrdersScreen(),
        );

      case AppRoutes.cancelOrderScreen:
        return MaterialPageRoute(
          builder: (context) => CancelOrderScreen(),
        );

      case AppRoutes.followOrderScreen:
        return MaterialPageRoute(
          builder: (context) => FollowOrderScreen(),
        );

      case AppRoutes.detailsScreen:
        return MaterialPageRoute(
          builder: (context) => DetailsScreen(),
        );

      // case AppRoutes.:
      //   return MaterialPageRoute(
      //     builder: (context) => (),
      //   );

      // case AppRoutes.:
      //   return MaterialPageRoute(
      //     builder: (context) => (),
      //   );

      // case AppRoutes.:
      //   return MaterialPageRoute(
      //     builder: (context) => (),
      //   );

      default:
        return null;
    }
  }
}
