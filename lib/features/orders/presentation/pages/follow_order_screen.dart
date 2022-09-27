import 'package:flutter/material.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/text_button.dart';

class FollowOrderScreen extends StatelessWidget {
  const FollowOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> meals = [
      'برجر بالجبن عدد 2',
      'بيتزا بصدر الدجاج عدد 3',
      'ميلك شيك أوريو عدد 2',
      'كيكة فانيلا عدد 1'
    ];
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          title: 'follow_order', // localization.text('cancel_order'),
          back: true,
        ),
        preferredSize: Size.fromHeight(context.height * 0.1),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            // SizedBox(
            //   height: context.height * 0.05,
            // ),
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(
                  horizontal: 20, vertical: context.height * 0.08),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'الوجبات المطلوبة :',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: meals.length,
                        itemBuilder: (context, i) {
                          return Text(meals[i]);
                        }),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    const Text('اجمالى المبلغ :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16)),
                    const Text('100 دينار'),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    const Text('العنوان :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16)),
                    const Text('حى الحارثية - بغداد'),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    const Text('رقم الهاتف :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16)),
                    const Text('+96447894'),
                  ],
                ),
              ),
            ),
            Center(
              child: CustomTextButton(
                title: 'send', // localization.text('send'),
                function: () {},
              ),
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
