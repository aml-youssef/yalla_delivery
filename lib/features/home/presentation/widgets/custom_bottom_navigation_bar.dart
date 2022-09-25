// import 'package:flutter/material.dart';
// import 'package:yalladelivery/core/themes/themes.dart';
// import 'package:yalladelivery/features/localization/manager/app_localization.dart';

// class CustomBottomNavigationbBar extends StatefulWidget {
//   final Function onTap;
//   final int inx;
//   const CustomBottomNavigationbBar({
//     Key? key,
//     required this.onTap,
//     required this.inx,
//   }) : super(key: key);

//   @override
//   _CustomBottomNavigationbBarState createState() =>
//       _CustomBottomNavigationbBarState();
// }

// class _CustomBottomNavigationbBarState
//     extends State<CustomBottomNavigationbBar> {
//   int inxShop = 1;
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//         selectedLabelStyle: MainTheme.hintTextStyle,
//         unselectedLabelStyle: MainTheme.subTextStyle2,
//         unselectedIconTheme: const IconThemeData(color: Colors.grey, size: 25),
//         unselectedItemColor: Colors.black,
//         selectedItemColor: const Color(0xffCFA407),
//         selectedIconTheme: const IconThemeData(color: Color(0xffCFA407)),
//         iconSize: 25,
//         currentIndex: widget.inx,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.grey[200],
//         onTap: (index) {
//           setState(() {
//             inxShop = index;
//           });
//           widget.onTap(index);
//         },
//         items: [
//           const BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage('assets/images/3.png')),
//             label: 'الرئيسية',
//           ),
//           BottomNavigationBarItem(
//             icon: const ImageIcon(AssetImage('assets/images/4.png')),
//             label: localization.text('balance'),
//           ),
//           const BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage('assets/images/7.png')),
//             label: 'الطلبات',
//           ),
//           BottomNavigationBarItem(
//             icon: const ImageIcon(AssetImage('assets/images/6.png')),
//             label: localization.text('notifications'),
//           ),
//           BottomNavigationBarItem(
//             icon: const ImageIcon(AssetImage('assets/images/5.png')),
//             label: localization.text('my_profile'),
//           ),
//         ]);
//   }
// }
