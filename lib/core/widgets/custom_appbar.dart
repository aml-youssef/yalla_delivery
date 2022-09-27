import 'package:flutter/material.dart';

import '../../config/themes/screen_utitlity.dart';
import '../../config/themes/themes.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool? back;
  const CustomAppBar({Key? key, required this.title, this.back})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MainStyle.primaryColor,
      title: Row(
        textDirection: TextDirection.rtl,
        children: [
          Visibility(
              visible: back == true,
              child: IconButton(
                padding: const EdgeInsets.only(top: 30),
                onPressed: () {}, //NavigationService.goBack(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              title!,
              style: MainTheme.headingTextStyle,
            ),
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }
}
