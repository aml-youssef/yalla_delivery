import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_delivery/features/auth/presentation/pages/login.dart';

import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../service_locator.dart';

class AppRoutes {
  static const String spalashScreen = '/';
  static const String loginScreen = '/loginScreen';
  static const String signUpScrreen = '/signUpScrreen';
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
            builder: (context) => BlocProvider(
                  create: (context) => sl<AuthCubit>(),
                  child: LoginScreen(),
                ),);

      // case AppRoutes.favouriteQuotesRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => const FavouriteQuotesScreen());
      default:
        return null;
    }
  }
}
