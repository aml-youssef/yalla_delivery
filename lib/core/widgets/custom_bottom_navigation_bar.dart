import 'package:flutter/material.dart';

import '../../config/themes/text_styles.dart';

class CustomBottomNavigationbBar extends StatefulWidget {
  final Function onTap;
  final int inx;
  const CustomBottomNavigationbBar({
    Key? key,
    required this.onTap,
    required this.inx,
  }) : super(key: key);

  @override
  _CustomBottomNavigationbBarState createState() =>
      _CustomBottomNavigationbBarState();
}

class _CustomBottomNavigationbBarState
    extends State<CustomBottomNavigationbBar> {
  int inxShop = 1;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedLabelStyle: MainTheme.hintTextStyle,
        unselectedLabelStyle: MainTheme.subTextStyle2,
        unselectedIconTheme: const IconThemeData(color: Colors.grey, size: 25),
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color(0xffCFA407),
        selectedIconTheme: const IconThemeData(color: Color(0xffCFA407)),
        iconSize: 25,
        currentIndex: widget.inx,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[200],
        onTap: (index) {
          setState(() {
            inxShop = index;
          });
          widget.onTap(index);
        },
        items:const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/3.png')),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/4.png')),
            label: 'الرصيد',//localization.text('balance'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/7.png')),
            label: 'الطلبات',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/6.png')),
            label: 'الاشعارات',//localization.text('notifications'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/5.png')),
            label: 'حسابي', //localization.text('my_profile'),
          ),
        ]);
  }
}
