import 'package:flutter/material.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import '../../../../config/themes/themes.dart';
import '../../../../core/widgets/custom_appbar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          title: 'التفاصيل',
          back: true,
        ),
        preferredSize: Size.fromHeight(context.height * 0.1),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: Column(
            children: [
              Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'الطلب',
                              style: MainTheme.mainTextStyle
                                  .copyWith(fontSize: 14),
                            ),
                            Text(
                              'العدد',
                              style: MainTheme.mainTextStyle
                                  .copyWith(fontSize: 14),
                            ),
                            Text(
                              'السعر',
                              style: MainTheme.mainTextStyle
                                  .copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'برجر بالجبن',
                                style: MainTheme.hintTextStyle
                                    ,
                              ),
                              Text(
                                '2',
                                style: MainTheme.hintTextStyle
                                    ,
                              ),
                              Text(
                                '50 دينار',
                                style: MainTheme.hintTextStyle
                                    ,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'اجمالى المبلغ    450 دينار',
                    style: MainTheme.headingTextStyle2.copyWith(fontSize: 16),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
