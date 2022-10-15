import 'package:flutter/material.dart';
import 'package:yalla_delivery/config/routes/route_paths.dart';
import 'package:yalla_delivery/features/auth/presentation/pages/login_screen.dart';
import 'package:yalla_delivery/features/my_Profile/presentation/pages/change_password_screen.dart';
import 'package:yalla_delivery/features/my_Profile/presentation/pages/my_profile_screen.dart';
import 'package:yalla_delivery/features/orders/presentation/pages/details_screen.dart';
import 'package:yalla_delivery/features/orders/presentation/pages/orders_screen.dart';
import '../../core/widgets/no_internet_connection_screen.dart';
import '../../features/auth/presentation/pages/phone_verification_screen.dart';
import '../../features/auth/presentation/pages/set_password_screen.dart';
import '../../features/auth/presentation/pages/signup_screen.dart';
import '../../features/auth/presentation/pages/verification_code_screen.dart';
import '../../features/balance/presentation/pages/balance_screen.dart';
import '../../features/balance/presentation/pages/get_money_screen.dart';
import '../../features/home/presentation/pages/main_page.dart';
import '../../features/map/presentation/pages/map_screen.dart';
import '../../features/notifications/presentation/pages/notification_details_screen.dart';
import '../../features/notifications/presentation/pages/notifications_screen.dart';
import '../../features/orders/presentation/pages/cancel_order_screen.dart';
import '../../features/orders/presentation/pages/follow_order_screen.dart';


class Routes {
  static Route? onGenetatearoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case AppRoutes.spalashScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const SpalshScreen(),
      //   );

      case RoutePaths.loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
          settings: routeSettings,
        );

      case RoutePaths.myprofileScreen:
        return MaterialPageRoute(
          builder: (context) => MyProfileScreen(),
          settings: routeSettings,
        );

      case RoutePaths.changePasswordScreen:
        return MaterialPageRoute(
          builder: (context) => ChangePasswordScreen(),
          settings: routeSettings,
        );

      case RoutePaths.ordersScreen:
        return MaterialPageRoute(
          builder: (context) => OrdersScreen(),
          settings: routeSettings,
        );

      case RoutePaths.cancelOrderScreen:
        return MaterialPageRoute(
          builder: (context) => CancelOrderScreen(),
          settings: routeSettings,
        );

      case RoutePaths.followOrderScreen:
        return MaterialPageRoute(
          builder: (context) => FollowOrderScreen(),
          settings: routeSettings,
        );

      case RoutePaths.detailsScreen:
        return MaterialPageRoute(
          builder: (context) => DetailsScreen(),
          settings: routeSettings,
        );

      case RoutePaths.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
          settings: routeSettings,
        );

      case RoutePaths.phoneVerificationScreen:
        return MaterialPageRoute(
          builder: (context) => PhoneVerificationScreen(),
          settings: routeSettings,
        );

      case RoutePaths.verificationcodeScreen:
        return MaterialPageRoute(
          builder: (context) => VerificationcodeScreen(),
          settings: routeSettings,
        );

      case RoutePaths.setPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => SetPasswordScreen(),
          settings: routeSettings,
        );

      case RoutePaths.getMoneyScreen:
        return MaterialPageRoute(
          builder: (context) => GetMoneyScreen(),
          settings: routeSettings,
        );

      case RoutePaths.balanceScreen:
        return MaterialPageRoute(
          builder: (context) => BalanceScreen(),
          settings: routeSettings,
        );

      case RoutePaths.notificationsScreen:
        return MaterialPageRoute(
          builder: (context) => NotificationsScreen(),
          settings: routeSettings,
        );

      case RoutePaths.notificationsDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => NotificationsDetailsScreen(),
          settings: routeSettings,
        );

      case RoutePaths.mapScreen:
        return MaterialPageRoute(
          builder: (context) => MapScreen(),
          settings: routeSettings,
        );

      case RoutePaths.mainPage:
        return MaterialPageRoute(
          builder: (context) => MainPage(),
          settings: routeSettings,
        );

      case RoutePaths.noInternetConnection:
        return MaterialPageRoute(
          builder: (context) => NoInternetConnection(),
        );

      // case RoutePaths.:
      //   return MaterialPageRoute(
      //     builder: (context) => (),
      //   );

      // case RoutePaths.:
      //   return MaterialPageRoute(
      //     builder: (context) => (),
      //   );

      default:
        return null;
    }
  }
}
