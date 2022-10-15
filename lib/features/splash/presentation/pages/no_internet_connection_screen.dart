// import 'package:flutter/material.dart';

// import '../../../../config/routes/navigation_service.dart';
// import '../../../../config/routes/route_paths.dart';
// import '../../../../core/widgets/popup_page.dart';

// class NoInternetConnection extends StatelessWidget {
//   final bool offAll;

//   const NoInternetConnection({
//     this.offAll = false,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PopUpPage(
//       onWillPop: () {
//         NavigationService.pushReplacementAll(
//           isNamed: true,
//           page: RoutePaths.spalashScreen,
//         );
//         return Future.value(true);
//       },
//       child: Padding(
//         padding:
//             EdgeInsets.symmetric(horizontal: Sizes.screenHPaddingDefault()),
//         child: DataErrorComponent(
//           title: tr(context).noInternetConnection,
//           description: tr(context).pleaseCheckYourDeviceNetwork,
//           onPressed: () {
//             ConnectivityService().checkIfConnected().then(
//               (value) {
//                 if (value) {
//                   if (offAll) {
//                     NavigationService.pushReplacementAll(
//                       isNamed: true,
//                       page: RoutePaths.coreSplash,
//                     );
//                   } else {
//                     NavigationService.goBack();
//                   }
//                 }
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
