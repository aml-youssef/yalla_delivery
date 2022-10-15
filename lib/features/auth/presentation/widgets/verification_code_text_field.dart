import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pinput/pinput.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';

import '../../../../config/themes/screen_utitlity.dart';
import '../../../../config/themes/text_styles.dart';

class VerificationCodeTextField extends StatelessWidget {
  VerificationCodeTextField({super.key, this.validator, this.onChange});
  // final ValueChanged<String>? onSubmitted;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChange;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      defaultPinTheme: PinTheme(
        width: context.width * 0.1,
        height: context.height * 0.05,
        textStyle: MainTheme.mainTextStyle.copyWith(fontSize: 16),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 209, 212, 211),
          border: Border.all(color: Color.fromARGB(255, 209, 212, 211)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: context.width * 0.1,
        height: context.height * 0.05,
        textStyle: MainTheme.mainTextStyle.copyWith(fontSize: 16),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 209, 212, 211),
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      submittedPinTheme: PinTheme(
        width: context.width * 0.1,
        height: context.height * 0.05,
        textStyle: MainTheme.mainTextStyle.copyWith(fontSize: 16),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 209, 212, 211),
          border: Border.all(color: MainColors.primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      length: 6,
      onChanged: onChange,
      // onSubmitted: onSubmitted,
      validator: validator,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }
}
