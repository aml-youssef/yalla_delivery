import 'package:flutter/material.dart';

import '../../core/widgets/custom_toast.dart';


class NavigationService {
  static final GlobalKey<NavigatorState> navigationKey =
      GlobalKey<NavigatorState>();

  static get context => navigationKey.currentState?.context;

  static removeAllFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static removeOverlays() {
    CustomToast.instance.fToast.removeQueuedCustomToasts();
  }

  static Future<dynamic> push(
      {bool isNamed = false,
      required dynamic page,
      dynamic arguments,
      bool preventDuplicates = true,
      bool closeOverlays = false,
      bool maintainState = true,
      bool rootNavigator = false,
      bool fullscreenDialog = false}) async {
    removeAllFocus(context);
    if (closeOverlays) {
      removeOverlays();
    }
    if (isNamed) {
      if (preventDuplicates) {
        final isDuplicate = checkDuplicateRoute(page, arguments);
        if (isDuplicate) return;
      }
      return await Navigator.pushNamed(
        context,
        page,
        arguments: arguments,
      );
    } else {
      return await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState,
        ),
      );
    }
  }

  static Future<dynamic> pushReplacement(
      {bool isNamed = false,
      required dynamic page,
      dynamic arguments,
      bool preventDuplicates = true,
      bool closeOverlays = false,
      bool maintainState = true,
      bool fullscreenDialog = false}) async {
    removeAllFocus(context);
    if (closeOverlays) {
      removeOverlays();
    }
    if (isNamed) {
      if (preventDuplicates) {
        final isDuplicate = checkDuplicateRoute(page, arguments);
        if (isDuplicate) return;
      }
      return await Navigator.pushReplacementNamed(
        context,
        page,
        arguments: arguments,
      );
    } else {
      return await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => page,
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState,
        ),
      );
    }
  }

  static Future<dynamic> goBack<T>({
    T? result,
    bool maybePop = true,
    bool closeOverlays = false,
  }) async {
    removeAllFocus(context);
    if (closeOverlays) {
      removeOverlays();
    }
    if (maybePop) {
      return await Navigator.maybePop(context, result);
    } else {
      Navigator.pop(context, result);
    }
  }

  static popUntil({
    required RoutePredicate predicate,
    bool closeOverlays = false,
  }) {
    removeAllFocus(context);
    if (closeOverlays) {
      removeOverlays();
    }
    Navigator.popUntil(context, predicate);
  }

  static Future<T?>? pushReplacementAll<T>(
      {bool isNamed = false,
      required dynamic page,
      dynamic arguments,
      bool closeOverlays = false,
      bool maintainState = true,
      bool fullscreenDialog = false}) async {
    removeAllFocus(context);
    if (closeOverlays) {
      removeOverlays();
    }
    if (isNamed) {
      return await Navigator.pushNamedAndRemoveUntil(
        context,
        page,
        (route) => false,
        arguments: arguments,
      );
    } else {
      return await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => page,
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState,
        ),
        (route) => false,
      );
    }
  }

  // static Future<T?>? pushAndRemoveUntil<T>(
  //     {bool isNamed = false,
  //     required dynamic page,
  //     required bool Function(Route<dynamic>) predicate,
  //     dynamic arguments,
  //     bool closeOverlays = false,
  //     bool maintainState = true,
  //     bool fullscreenDialog = false}) async {
  //   removeAllFocus(context);
  //   if (closeOverlays) {
  //     removeOverlays();
  //   }
  //   if (isNamed) {
  //     return await Navigator.pushNamedAndRemoveUntil(
  //       context,
  //       page,
  //       predicate,
  //       arguments: arguments,
  //     );
  //   } else {
  //     return await Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => page,
  //         fullscreenDialog: fullscreenDialog,
  //         maintainState: maintainState,
  //       ),
  //       predicate,
  //     );
  //   }
  // }

  static bool checkDuplicateRoute(
    String page,
    dynamic arguments,
  ) {
    bool isNewRouteSameAsCurrent = false;
    popUntil(
      predicate: (route) {
        if (route.settings.name == page &&
            route.settings.arguments == arguments) {
          isNewRouteSameAsCurrent = true;
        }
        return true;
      },
    );
    return isNewRouteSameAsCurrent;
  }
}
