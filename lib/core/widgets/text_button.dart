import 'package:flutter/material.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import '../../config/themes/screen_utitlity.dart';
import '../../config/themes/themes.dart';

class CustomTextButton extends StatelessWidget {
  final String? title;
  final double? width, radius;
  final void Function() function;
  const CustomTextButton(
      {Key? key,
      required this.title,
      required this.function,
      this.width,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.05,
      width: width ?? context.width * 0.34,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // Foreground color
          onPrimary: Theme.of(context).colorScheme.onSecondaryContainer,
          // Background color
          primary: MainStyle.primaryColor,
          shadowColor: MainStyle.shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
          elevation: 5,
        ),
        onPressed: function,
        child: Text(
          title!,
          style: MainTheme.buttonTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
// TextButton(
//         onPressed: function,
//         child: Text(
//           title!,
//           style: MainTheme.buttonTextStyle,
//           // textAlign: TextAlign.center,
//         ),
//         style: TextButton.styleFrom(
//           elevation: 5,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(radius ?? 10)),
//           shadowColor: MainStyle.shadowColor,
//           backgroundColor: MainStyle.primaryColor,
//         ),
//       ),