import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_delivery/service_locator.dart';
import 'app.dart';
import 'bloc_observer.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  ServiceLocator().init();
  Bloc.observer = AppBlocObserver();
  
  runApp(const MyApp());
}
