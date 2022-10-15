import 'package:flutter/material.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import 'package:yalla_delivery/core/widgets/text_button.dart';
import '../../config/themes/text_styles.dart';

class CustomOptionDialog extends StatelessWidget {
  final String title;
  final void Function() function;
  const CustomOptionDialog(
      {Key? key, required this.title, required this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: MainTheme.mainTextStyle.copyWith(fontSize: 14),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextButton(
                width: context.width * 0.17,
                title: 'no', // localization.text('no'),
                function: () {
                  // NavigationService.goBack();
                  Navigator.pop(context);
                },
              ),
              CustomTextButton(
                width: context.width * 0.17,
                title: 'yes', //localization.text('yes'),
                function: function,
              )
            ],
          ),
        )
      ],
    );
  }
}
