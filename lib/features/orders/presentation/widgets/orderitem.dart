import 'package:flutter/material.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import '../../../../config/themes/text_styles.dart';
import '../../../../core/widgets/custom_rating.dart';
import '../../../../core/widgets/text_button.dart';

class OrdersItem extends StatelessWidget {
  final bool isAcceptd;
  // final Order order;
  const OrdersItem({
    Key? key,
    required this.isAcceptd,
    // required this.order,
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
            padding: const EdgeInsets.all(20.0),
            height: context.height * 0.35,
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
                            style: MainTheme.mainTextStyle,
                          ),
                          Text(
                            '4',
                            overflow: TextOverflow.ellipsis,
                            style: MainTheme
                                .mainTextStyle, //.copyWith(fontSize: 10),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'العنوان : حي الحارثية بغدادت',
                              maxLines: 4,
                              softWrap: true,
                              style: MainTheme.mainTextStyle,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'رقم الهاتف : ',
                            style: MainTheme.mainTextStyle,
                          ),
                          Text(
                            '484584458',
                            style: MainTheme.mainTextStyle
                                .apply(fontWeightDelta: 0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                'المبلغ : ',
                                style: MainTheme.mainTextStyle,
                              ),
                              Text(
                                '400 دينار',
                                style: MainTheme.mainTextStyle
                                    .apply(fontWeightDelta: 0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Visibility(
                  visible: isAcceptd,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextButton(
                        title: 'التفاصيل',
                        width: context.width * 0.25,
                        buttonFontSize: 11,
                        function: () {
                          // NavigationService.push(
                          //     page: RoutePaths.mainPage, isNamed: false);
                        },
                      ),
                      CustomTextButton(
                        title: 'تقييم المطعم',
                        width: context.width * 0.25,
                        buttonFontSize: 11,
                        function: () async {
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomRating(
                                  function: () {
                                    // rateOrder.rateOrders(order.id);
                                  },
                                );
                              });
                        },
                      ),
                      CustomTextButton(
                        title: 'الرصيد',
                        width: context.width * 0.25,
                        buttonFontSize: 11,
                        function: () async {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
