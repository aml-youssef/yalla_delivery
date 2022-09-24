import 'package:flutter/material.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
// import '../localization/manager/app_localization.dart';
import 'custom_appbar.dart';

class PopUpPage extends StatelessWidget {
  final Widget child;
  final bool showAppbar,
      appBarWithBack,
      extendBodyBehindAppBar,
      resizeToAvoidBottomInset,
      safeAreaTop,
      safeAreaBottom,
      showUpperShadow;
  final String? appBartitle;
  final Function? skipBehaviour;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  final Widget? backButtonWidget, bottomNavigationBar,floatingActionButton;

  final Future<bool> Function()? onWillPop;

  const PopUpPage({
    Key? key,
    required this.child,
    this.appBarWithBack = false,
    this.skipBehaviour,
    this.scaffoldKey,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = false,
    this.floatingActionButton,
    this.onWillPop,
    this.backButtonWidget,
    this.safeAreaTop = false,
    this.showUpperShadow = false,
    this.appBartitle,
    this.showAppbar = false,
    this.safeAreaBottom = false,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop ?? () => Future.value(true),
      child: SafeArea(
        top: safeAreaTop,
        bottom: safeAreaBottom,
       
        child:Directionality(
      textDirection:true //TODO:localization.currentLanguage.toString() == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
          key: scaffoldKey,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          bottomNavigationBar: bottomNavigationBar,
          appBar: showAppbar
              ? PreferredSize(
                  preferredSize: Size.fromHeight(context.appBarHeight!),
                  child: CustomAppBar(
                    title: appBartitle!,
                    back: appBarWithBack,
                  ))
              : null,
          floatingActionButton: floatingActionButton,
          body: Stack(alignment: Alignment.center, children: [
            child,
            if (showUpperShadow)
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 400, //TODO:Sizes.screenTopShadowHeight(),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xde000000), Color(0x00000000)],
                      stops: [0, 0.4],
                      begin: Alignment.topCenter,
                      end: Alignment(0, .1),
                    ),
                  ),
                ),
              )
          ]),
        ),
      ),),
    );
  }
}
