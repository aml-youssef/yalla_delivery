import 'package:flutter/material.dart';

import '../../config/themes/screen_utitlity.dart';
import '../../config/themes/themes.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool? back, rtl;
  const CustomAppBar({Key? key, required this.title, this.back, this.rtl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: MainStyle.primaryColor,
      title: Row(
        textDirection: rtl == true? TextDirection.rtl: TextDirection.ltr,
        children: [
          Visibility(
              visible: back == true,
              child: IconButton(
                padding: const EdgeInsets.only(top: 30),
                onPressed: () {
                  Navigator.pop(context);
                }, //NavigationService.goBack(),
                icon: Icon(
                  rtl == true ?Icons.arrow_forward_ios:Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              title!,
              style: MainTheme.buttonTextStyle.copyWith(fontSize: 18),
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
