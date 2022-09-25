import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_delivery/features/my_Profile/presentation/pages/change_password_screen.dart';
import 'package:yalla_delivery/service_locator.dart';
import 'config/routes/app_routes.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/auth/presentation/pages/login.dart';
import 'features/my_Profile/presentation/pages/my_profile_screen.dart';

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
      home: MyProfileScreen(),
    );
  }
}
