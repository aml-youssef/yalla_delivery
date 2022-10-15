import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';

import '../../config/themes/screen_utitlity.dart';
import '../../config/themes/text_styles.dart';

class CustomToast {
  CustomToast._();

  static final instance = CustomToast._();

  late FToast fToast = FToast();

  showDefaultToast(
    BuildContext context, {
    String title = '',
    String description = '',
    Color? backgroundColor,
    Gradient? backgroundGradient,
    double? borderRadius,
    BoxBorder? border,
    EdgeInsets? padding,
    EdgeInsets? margin,
    ToastGravity toastGravity = ToastGravity.TOP,
    Duration toastDuration = const Duration(seconds: 3),
    int fadeDuration = 350,
  }) {
    fToast.init(context);

    final toast = Container(
      width: double.infinity,
      margin: margin,
      padding: padding ??
          EdgeInsets.symmetric(
            vertical: context.height*0.02,
            horizontal: context.width * 0.05,
          ),
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFF303030),
        gradient: backgroundGradient ?? MainColors.primaryIngredientColor,
        borderRadius: BorderRadius.circular(
          borderRadius ?? 20,
        ),
        border: border,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 4, top: 4),
            child: Text(
              title,
              style: MainTheme.hintTextStyle
                  .copyWith(fontSize: 16,),
              maxLines: 2,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 4.0,
            ),
            child: Text(
              description,
              style: MainTheme.hintTextStyle,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );

    fToast.removeCustomToast();
    fToast.showToast(
      child: toast,
      gravity: toastGravity,
      toastDuration: toastDuration,
      fadeDuration: fadeDuration,
    );
  }

  Future showBackgroundToast({
    required BuildContext context,
    String msg = '',
    Color? backgroundColor,
    Toast toastLength = Toast.LENGTH_LONG,
    ToastGravity toastGravity = ToastGravity.TOP,
  }) async {
    await Fluttertoast.showToast(
      msg: msg,
      fontSize: 16,
      textColor: Colors.white,
      backgroundColor:
          backgroundColor ?? Theme.of(context).primaryColor,
      toastLength: toastLength,
      gravity: toastGravity,
      timeInSecForIosWeb: 1,
    );
  }
}
