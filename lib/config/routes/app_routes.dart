import 'package:flutter/material.dart';
import 'package:yalla_delivery/features/auth/presentation/pages/login_screen.dart';
import 'package:yalla_delivery/features/my_Profile/presentation/pages/change_password_screen.dart';
import 'package:yalla_delivery/features/my_Profile/presentation/pages/my_profile_screen.dart';
import 'package:yalla_delivery/features/orders/presentation/pages/details_screen.dart';
import 'package:yalla_delivery/features/orders/presentation/pages/orders_screen.dart';
import '../../features/auth/presentation/pages/phone_verification_screen.dart';
import '../../features/auth/presentation/pages/set_password_screen.dart';
import '../../features/auth/presentation/pages/signup_screen.dart';
import '../../features/auth/presentation/pages/verification_code_screen.dart';
import '../../features/balance/presentation/pages/balance_screen.dart';
import '../../features/balance/presentation/pages/get_money_screen.dart';
import '../../features/map/presentation/pages/map_screen.dart';
import '../../features/notifications/presentation/pages/notification_details_screen.dart';
import '../../features/notifications/presentation/pages/notifications_screen.dart';
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
  static const String signUpScreen = '/SignUpScreen';
  static const String phoneVerificationScreen = '/PhoneVerificationScreen';
  static const String verificationcodeScreen = '/VerificationcodeScreen';
  static const String setPasswordScreen = '/SetPasswordScreen';
  static const String getMoneyScreen = '/GetMoneyScreen';
  static const String balanceScreen = '/BalanceScreen';
  static const String notificationsScreen = '/NotificationsScreen';
  static const String notificationsDetailsScreen = '/NotificationsDetailsScreen';
  static const String mapScreen = '/MapScreen';
  // static const String  = '/';
  // static const String  = '/';
  // static const String  = '/';
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

      case AppRoutes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );

      case AppRoutes.phoneVerificationScreen:
        return MaterialPageRoute(
          builder: (context) => PhoneVerificationScreen(),
        );

      case AppRoutes.verificationcodeScreen:
        return MaterialPageRoute(
          builder: (context) => VerificationcodeScreen(),
        );

      case AppRoutes.setPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => SetPasswordScreen(),
        );

      case AppRoutes.getMoneyScreen:
        return MaterialPageRoute(
          builder: (context) => GetMoneyScreen(),
        );

      case AppRoutes.balanceScreen:
        return MaterialPageRoute(
          builder: (context) => BalanceScreen(),
        );

      case AppRoutes.notificationsScreen:
        return MaterialPageRoute(
          builder: (context) => NotificationsScreen(),
        );

      case AppRoutes.notificationsDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => NotificationsDetailsScreen(),
        );

      case AppRoutes.mapScreen:
        return MaterialPageRoute(
          builder: (context) => MapScreen(),
        );

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
