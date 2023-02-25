import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import '../../../../config/routes/route_paths.dart';
import '../../../../config/themes/text_styles.dart';
import '../../../../core/functions/helper_functions.dart';
import '../../../../core/widgets/text_button.dart';
import '../../../../service_locator.dart';
import '../cubit/verification_cubit/verification_cubit.dart';

class PhoneVerificationScreen extends StatelessWidget {
  PhoneVerificationScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String phoneNumber;

  void _saveForm(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();

    await BlocProvider.of<VerificationCubit>(context)
        .sendVerificationCode(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VerificationCubit>(),
      child: BlocConsumer<VerificationCubit, VerificationState>(
        listener: (context, state) {
          if (state is VerificationErrorState) {
            HelperFunctions.errorBar(
              context,
              message: state.errorMsg,
              duration: const Duration(seconds: 5),
              title: 'ERROR',
            );
          }
          if (state is VerificationLoadedState) {
                      Navigator.pushNamedAndRemoveUntil(
              context, RoutePaths.verificationcodeScreen, (route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.height * 0.13,
                  ),
                  Image(
                    image: const AssetImage('assets/images/yallaDeilvery.png'),
                    width: context.width * 0.45,
                    height: context.height * 0.2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: context.height * 0.04, horizontal: 16),
                    child: Text(
                      'من فضلك قم بادخال رقم الهاتف لارسال الكود الخاص بك',
                      textAlign: TextAlign.right,
                      style: MainTheme.hintTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: SizedBox(
                      width: context.width * 0.7,
                      child: IntlPhoneField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          counterText: '',
                          filled: true,
                          fillColor: const Color.fromARGB(255, 227, 230, 228),
                          contentPadding: const EdgeInsets.only(
                            top: 10,
                          ),
                        ),
                        // initialCountryCode: 'IN',
                        // onChanged: (phone) {
                        //   print(phone.completeNumber);
                        // },
                        onSaved: (value) => phoneNumber = value.toString(),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'invalid_phone_number'; // localization.text('invalid_phone_number');
                          }
                          if (value.toString().length < 2) {
                            //TODO : < 11
                            return 'invalid_phone_number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 20, top: context.height * 0.06),
                    child: ConditionalBuilder(
                      condition: state is! VerificationLoadingState,
                      builder: (context) {
                        return CustomTextButton(
                          title: 'ارسال',
                          function: () {
                            _saveForm(context);
                          },
                          radius: 25,
                        );
                      },
                      fallback: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
