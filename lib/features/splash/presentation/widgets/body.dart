// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';

// import '../../../../core/utils/constants.dart';
// import '../../../../core/widgets/image_bg.dart';


// class SplashViewBody extends StatelessWidget {

//   const SplashViewBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // final AuthNotifier authNotifier = ref.read(loginProvider.notifier);
//     determinePage(authNotifier);
//     return const ImageBG(
//       network: false,
//       image: kAppLogog,
//       width: double.infinity,
//       height: double.infinity,
//     );
//   }

//   void determinePage(AuthNotifier authNotifier) async {
//     ConnectivityService.instance.checkIfConnected().then((value) async {
    
//       if (value) {
//         bool isFirstTime = GetStorage().read(kIsFirstTime) ?? true;

//         if (isFirstTime) {
//           NavigationService.pushReplacementAll(
//               page: RoutePaths.settingsLanguage, isNamed: true);
//         } else {
//           bool isLoggedIn = GetStorage().read(kIsLoggedIn) ?? false;

//           if (isLoggedIn) {
         
//             await authNotifier.fetchUserData();
//           } else {
//             NavigationService.pushReplacementAll(
//                 page: RoutePaths.authLogin, isNamed: true);
//           }
//         }
//       } else {
//         NavigationService.pushReplacementAll(
//           isNamed: true,
//           page: RoutePaths.coreNoInternet,
//           arguments: {'fromSplash': true},
//         );
//       }
//     });
//   }
// }
