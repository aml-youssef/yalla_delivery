import 'package:flutter/material.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import '../../../../config/themes/text_styles.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_form_field.dart';
import '../../../../core/widgets/text_button.dart';

class CancelOrderScreen extends StatelessWidget {
  const CancelOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(context.height * 0.1),
        child: const CustomAppBar(
          title: 'cancel_order', // localization.text('cancel_order'),
          back: true,
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  'أسباب الغاء الطلب',
                  style: MainTheme.mainTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Checkbox(
                    value: true,
                    onChanged: (value) {
                    },
                    activeColor: Colors.grey,
                    checkColor: Colors.white,
                  ),
                  Text(
                    'هاتف الزبون مغلق',
                    style: MainTheme.hintTextStyle,
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Checkbox(
                    value: true,
                    onChanged: (value) {
                    },
                    activeColor: Colors.grey,
                    checkColor: Colors.white,
                  ),
                  Text(
                    'الزبون لا يرد',
                    style: MainTheme.hintTextStyle,
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Checkbox(
                    value: true,
                    onChanged: (value) {
                    },
                    activeColor: Colors.grey,
                    checkColor: Colors.white,
                  ),
                  Text(
                    'مكان الزبون غير آمن',
                    style: MainTheme.hintTextStyle,
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Checkbox(
                    value: true,
                    onChanged: (value) {
                    },
                    activeColor: Colors.grey,
                    checkColor: Colors.white,
                  ),
                  Text(
                    'أسباب أخرى',
                    style: MainTheme.hintTextStyle,
                  )
                ],
              ),
              Visibility(
                visible: true,
                child: SizedBox(
                  height: context.height * 0.2,
                  width: context.width * 0.8,
                  child: Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(right: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: CustomFormField(
                      hintText: 'add_reply', // localization.text('add_reply'),
                      minLines: 5,
                      onChanged: (v) {},
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.1,
              ),
              Center(
                child: CustomTextButton(
                  title: 'send', // localization.text('send'),
                  function: () {},
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
