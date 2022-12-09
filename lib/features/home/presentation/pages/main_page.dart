import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_delivery/service_locator.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../../../../core/widgets/custom_option_dialog.dart';
import '../../../../core/widgets/popup_page.dart';
import '../cubit/home_cubit.dart';

class MainPage extends StatelessWidget {
  MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return PopUpPage(
                onWillPop: () async {
                  return await showDialog(
                    context: context,
                    useSafeArea: true,
                    builder: (context) => CustomOptionDialog(
                      title: 'هل تود الخروج',
                      function: () => SystemNavigator.pop(),
                    ),
                  );
                },
                showAppbar: true,
                appBartitle: cubit.pages[cubit.currentIndex].appBartitle,
                bottomNavigationBar: BottomAppBar(
                  child: CustomBottomNavigationbBar(
                    onTap: (index) {
                      cubit.ChangeIndex(index);
                    },
                    inx: cubit.currentIndex,
                  ),
                ),
                child: cubit.pages[cubit.currentIndex].page);
          }),
    );
  }
}
