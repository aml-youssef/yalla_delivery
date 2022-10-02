import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_delivery/features/my_Profile/presentation/pages/change_password_screen.dart';
import 'package:yalla_delivery/features/orders/presentation/pages/orders_screen.dart';
import 'package:yalla_delivery/service_locator.dart';
import 'config/routes/app_routes.dart';
import 'features/auth/presentation/pages/login_screen.dart';
import 'features/auth/presentation/pages/phone_verification_screen.dart';
import 'features/auth/presentation/pages/set_password_screen.dart';
import 'features/auth/presentation/pages/signup_screen.dart';
import 'features/balance/presentation/pages/balance_screen.dart';
import 'features/my_Profile/presentation/pages/my_profile_screen.dart';
import 'features/notifications/presentation/pages/notifications_screen.dart';
import 'features/orders/presentation/pages/cancel_order_screen.dart';
import 'features/orders/presentation/pages/details_screen.dart';
import 'features/orders/presentation/pages/follow_order_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yalla Delivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenetatearoute,
      home: NotificationsScreen(),
    );
  }
}
