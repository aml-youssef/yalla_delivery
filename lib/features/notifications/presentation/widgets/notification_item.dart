import 'package:flutter/material.dart';
import 'package:yalla_delivery/config/routes/app_routes.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import '../../../../config/themes/themes.dart';
import '../../../../core/widgets/text_button.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: context.height * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'رقم الطلب : ',
                            style: MainTheme.hintTextStyle,
                          ),
                          Text(
                            '4',
                            overflow: TextOverflow.ellipsis,
                            style: MainTheme.hintTextStyle
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'العنوان : ',
                            style: MainTheme.hintTextStyle,
                          ),
                          Expanded(
                            child: Text(
                              'حى الحارثية - بغداد',
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: MainTheme.hintTextStyle
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                'المبلغ : ',
                                style: MainTheme.hintTextStyle,
                              ),
                              Text('400 دينار',
                                  style: MainTheme.hintTextStyle
                                      .copyWith(fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                CustomTextButton(
                  title: 'التفاصيل',
                  width: context.width * 0.25,
                  buttonFontSize: 11,
                  function: () {
                    Navigator.pushNamed(context, AppRoutes.detailsScreen);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
