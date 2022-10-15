import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Balance/presentation/pages/balance_screen.dart';
import '../../../map/presentation/pages/map_screen.dart';
import '../../../my_Profile/presentation/pages/my_profile_screen.dart';
import '../../../notifications/presentation/pages/notifications_screen.dart';
import '../../../orders/presentation/pages/orders_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);
  int currentIndex = 0;

  final List<Page> pages = [
    Page(page: const MapScreen(), appBartitle: 'الريئيسية'),
    Page(page: const BalanceScreen(), appBartitle: 'الرصيد'),
    Page(page: const OrdersScreen(), appBartitle: 'الطلبات'),
    Page(page: const NotificationsScreen(), appBartitle: 'الاشعارات'),
    Page(page: MyProfileScreen(), appBartitle: 'حسابي'),
  ];

  void ChangeIndex(int index) {
    emit(HomeInitialState());
    currentIndex = index;
    emit(HomeChangrNavigatoinBottomState());
  }
}

class Page {
  final Widget page;
  final String appBartitle;

  Page({required this.page, required this.appBartitle});
}
