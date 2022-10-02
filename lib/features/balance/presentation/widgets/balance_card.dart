import 'package:flutter/material.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';

import '../../../../config/themes/themes.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
    required this.firsttext,
    required this.secondText,
  });
  final String firsttext, secondText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.12,
      width: context.width * 0.35,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      margin: EdgeInsets.all(context.height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            firsttext,
            style: MainTheme.mainTextStyle.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 10),
          Text(
            secondText,
            style: MainTheme.mainTextStyle.copyWith(fontSize: 14),
          )
        ],
      ),
    );
  }
}
