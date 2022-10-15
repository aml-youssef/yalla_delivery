import 'package:flutter/material.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import '../../../../config/themes/text_styles.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/register_text_field.dart';
import '../../../../core/widgets/text_button.dart';

class GetMoneyScreen extends StatelessWidget {
  GetMoneyScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String money = '';

  Future<void> saveForm(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          title: 'طلب سحب',
          back: true,
          rtl: true,
        ),
        preferredSize: Size.fromHeight(context.height * 0.1),
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SizedBox(height: context.height * 0.2),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                alignment: Alignment.center,
                height: context.height * 0.35,
                width: context.width * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'المبلغ المطلوب',
                      style: MainTheme.mainTextStyle.copyWith(fontSize: 14),
                    ),
                    Form(
                      key: formKey,
                      child: SizedBox(
                        height: context.height * 0.05,
                        width: context.width * 0.35,
                        child: RegisterTextField(
                          fillColor: Colors.grey[300],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'invalid amount of money';
                            }
                            if (value.length < 2) {
                              return 'invalid amount of money';
                            }
                            if (value.length > 5) {
                              return 'invalid amount of money';
                            }
                            if (int.tryParse(value) == null ||
                                int.tryParse(value)! <= 1) {
                              return 'provide a valid number';
                            }
                            return null;
                          },
                          onSaved: (value) => money = value!,
                          type: TextInputType.number,
                        ),
                      ),
                    ),
                    CustomTextButton(
                      width: context.width * 0.2,
                      title: 'سحب',
                      function: () {
                        saveForm(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
