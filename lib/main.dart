import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_delivery/service_locator.dart';
import 'app.dart';
import 'bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  
  await ServiceLocator().init();
  
  // Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}
//flutter run --verbose
