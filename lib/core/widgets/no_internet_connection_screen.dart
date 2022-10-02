import 'package:flutter/material.dart';
import 'package:yalla_delivery/core/widgets/text_button.dart';
import 'popup_page.dart';

class NoInternetConnection extends StatelessWidget {
  final bool fromSplash;
  const NoInternetConnection({
    this.fromSplash = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopUpPage(
      onWillPop: () {
        // NavigationService.pushReplacementAll(
        //   isNamed: true,
        //   page: RoutePaths.coreSplash,
        // );
        return Future.value(true);
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              //    const CustomHeaderTitle(title: 'لا يوجد اتصال بالانترنت'),
              const SizedBox(
                height: 10,
              ),
              //     const CustomHeaderTitle(title: 'من فضلك افحص اتصالك بالانترنت'),
              const SizedBox(
                height: 10,
              ),
              CustomTextButton(
                  title: 'اعد الاتصال',
                  function: () {
                    // ConnectivityService.instance
                    //     .checkIfConnected()
                    //     .then((value) {
                    //   if (fromSplash) {
                    //     NavigationService.pushReplacementAll(
                    //       isNamed: true,
                    //       page: RoutePaths.coreSplash,
                    //     );
                    //   } else {
                    //     NavigationService.goBack();
                    //   }
                    // });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
