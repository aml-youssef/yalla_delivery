import 'package:flutter/material.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import 'package:yalla_delivery/core/widgets/text_button.dart';  
import '../../config/themes/themes.dart';

class CustomOptionDialog extends StatelessWidget {
  final String title;
  final void Function() function;
  const CustomOptionDialog(
      {Key? key, required this.title, required this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: MainTheme.headingTextStyle.copyWith(color: Colors.black),
      ),
      actions: [
        SizedBox(
          width: context.width * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextButton(
                title: 'no', // localization.text('no'),
                function: () {
                  // NavigationService.goBack();
                  Navigator.pop(context);
                },
              ),
              CustomTextButton(
                title: 'yes' ,//localization.text('yes'),
                function: function,
              )
            ],
          ),
        )
      ],
    );
  }
}
