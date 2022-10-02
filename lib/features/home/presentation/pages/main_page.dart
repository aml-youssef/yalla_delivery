import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/widgets/custom_option_dialog.dart';
import '../../../../core/widgets/popup_page.dart';
import '../../../Balance/presentation/pages/balance_screen.dart';
import '../../../map/presentation/pages/map_screen.dart';
import '../../../my_Profile/presentation/pages/my_profile_screen.dart';
import '../../../notifications/presentation/pages/notifications_screen.dart';
import '../../../orders/presentation/pages/orders_screen.dart';

class MainPage extends StatelessWidget {
  final int? index;
  MainPage({
    Key? key,
    this.index,
  }) : super(key: key);
  // final StateProvider<int> _bottomNavIndexProvider =
  //     StateProvider<int>(((ref) => 2));
  // final StateProvider<String> appBartitleProvider =
  //     StateProvider<String>(((ref) => 'الرئيسية'));

  final List<Widget> widgets = [
    const MapScreen(),
    const BalanceScreen(),
    const OrdersScreen(),
    const NotificationsScreen(),
    MyProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // int _bottomNavIndex = ref.watch(_bottomNavIndexProvider);
    // String? _appBartitle = ref.watch(appBartitleProvider);
    // if (index != null) {
    //   ref.read(_bottomNavIndexProvider.state).state = index!;
    // }
    return PopUpPage(
        onWillPop: () async {
          return await showDialog(
              context: context,
              useSafeArea: true,
              builder: (context) => CustomOptionDialog(
                    title: 'هل تود الخروج',
                    function: () => SystemNavigator.pop(),
                  ));
        },
        showAppbar: true,
        appBartitle: _appBartitle,
        child: widgets[_bottomNavIndex],
        bottomNavigationBar: BottomAppBar(
          child: CustomBottomNavigationbBar(
            onTap: (v) {
              ref.read(_bottomNavIndexProvider.state).state = v;
              if (_bottomNavIndex == 0) {
                ref.read(appBartitleProvider.state).state = 'الرئيسية';
                debugPrint(_appBartitle);
              } else if (_bottomNavIndex == 2) {
                ref.read(appBartitleProvider.state).state = 'الطلبات';
              } else if (_bottomNavIndex == 3) {
                ref.read(appBartitleProvider.state).state =
                    localization.text('notifications')!;
              } else if (_bottomNavIndex == 4) {
                ref.read(appBartitleProvider.state).state =
                    localization.text('my_profile')!;
              } else {
                ref.read(appBartitleProvider.state).state = 'الرصيد';
              }
            },
            inx: _bottomNavIndex,
          ),
        ));
  }
}
