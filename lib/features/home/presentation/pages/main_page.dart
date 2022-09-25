// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:yalladelivery/core/utils/widgets/custom_option_dialog.dart';
// import 'package:yalladelivery/features/MyProfile/presentaion/pages/my_profile.dart';
// import 'package:yalladelivery/features/balance/presentaion/pages/balance.dart';
// import 'package:yalladelivery/features/global_screens/popup_page.dart';
// import 'package:yalladelivery/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
// import 'package:yalladelivery/features/localization/manager/app_localization.dart';
// import 'package:yalladelivery/features/notifications/presentaion/pages/notifications.dart';
// import 'package:yalladelivery/features/orders/presentaion/pages/orders.dart';
// import '../../../map/screens/map_screen.dart';

// class MainPage extends ConsumerWidget {
//   final int? index;
//   MainPage({
//     Key? key,
//     this.index,
//   }) : super(key: key);
//   final StateProvider<int> _bottomNavIndexProvider =
//       StateProvider<int>(((ref) => 2));
//   final StateProvider<String> appBartitleProvider =
//       StateProvider<String>(((ref) => 'الرئيسية'));

//   final List<Widget> widgets = [
//     const MapScreen(),
//     const BalanceScreen(),
//     const OrdersScreen(),
//     const NotificationsScreen(),
//     MyProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     int _bottomNavIndex = ref.watch(_bottomNavIndexProvider);
//     String? _appBartitle = ref.watch(appBartitleProvider);
//     if (index != null) {
//       ref.read(_bottomNavIndexProvider.state).state = index!;
//     }
//     return PopUpPage(
//         onWillPop: () async {
//           return await showDialog(
//               context: context,
//               useSafeArea: true,
//               builder: (context) => CustomOptionDialog(
//                     title: 'هل تود الخروج',
//                     function: () => SystemNavigator.pop(),
//                   ));
//         },
//         showAppbar: true,
//         appBartitle: _appBartitle,
//         child: widgets[_bottomNavIndex],
//         bottomNavigationBar: BottomAppBar(
//           child: CustomBottomNavigationbBar(
//             onTap: (v) {
//               ref.read(_bottomNavIndexProvider.state).state = v;
//               if (_bottomNavIndex == 0) {
//                 ref.read(appBartitleProvider.state).state = 'الرئيسية';
//                 debugPrint(_appBartitle);
//               } else if (_bottomNavIndex == 2) {
//                 ref.read(appBartitleProvider.state).state = 'الطلبات';
//               } else if (_bottomNavIndex == 3) {
//                 ref.read(appBartitleProvider.state).state =
//                     localization.text('notifications')!;
//               } else if (_bottomNavIndex == 4) {
//                 ref.read(appBartitleProvider.state).state =
//                     localization.text('my_profile')!;
//               } else {
//                 ref.read(appBartitleProvider.state).state = 'الرصيد';
//               }
//             },
//             inx: _bottomNavIndex,
//           ),
//         ));
//   }
// }
