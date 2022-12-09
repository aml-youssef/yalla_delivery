import 'package:flutter/material.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import '../../config/themes/screen_utitlity.dart';
import '../../config/themes/text_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String? title;
  final double? width, radius, buttonFontSize;
  final void Function() function;
  const CustomTextButton({
    Key? key,
    required this.title,
    required this.function,
    this.width,
    this.radius,
    this.buttonFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.05,
      width: width ?? context.width * 0.35,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          // foregroundColor : Theme.of(context).colorScheme.onSecondaryContainer,
          backgroundColor: MainColors.primaryColor,
          shadowColor: MainColors.shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
          elevation: 0,
        ),
        onPressed: function,
        child: Text(
          title!,
          style: MainTheme.buttonTextStyle.copyWith(fontSize: buttonFontSize),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
