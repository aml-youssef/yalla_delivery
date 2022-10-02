import 'package:flutter/material.dart';
import 'package:yalla_delivery/config/routes/app_routes.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import '../../../../core/widgets/text_button.dart';
import '../widgets/balance_card.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: context.height * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BalanceCard(
                  firsttext: 'الرصيد',
                  secondText: '4000',
                ),
                BalanceCard(
                  firsttext: 'كاش باك',
                  secondText: '4000',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BalanceCard(
                  firsttext: 'عدد الطلبات',
                  secondText: '20',
                ),
                BalanceCard(
                  firsttext: 'اجمالى المبلغ',
                  secondText: '1000 دينار',
                ),
              ],
            ),
            SizedBox(height: context.height * 0.1),
            CustomTextButton(
              width: context.width * 0.45,
              title: 'طلب سحب',
              function: () {
                Navigator.pushNamed(context, AppRoutes.getMoneyScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
