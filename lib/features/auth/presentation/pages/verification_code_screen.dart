import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import '../../../../config/routes/route_paths.dart';
import '../../../../config/themes/text_styles.dart';
import '../../../../core/functions/helper_functions.dart';
import '../../../../core/widgets/text_button.dart';
import '../../../../service_locator.dart';
import '../cubit/verification_cubit/verification_cubit.dart';
import '../widgets/verification_code_text_field.dart';

class VerificationcodeScreen extends StatelessWidget {
  VerificationcodeScreen({super.key});
  late String verificationId;
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String smsCode, errorMsg;

  void _saveForm(BuildContext context) async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }
    // formKey.currentState!.save();
    verificationId =
        BlocProvider.of<VerificationCubit>(context).currentverificationId;
    await BlocProvider.of<VerificationCubit>(context)
        .checkVerificationCode(verificationId, smsCode);
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
              context, RoutePaths.setPasswordScreen, (route) => false);
        }
      }, builder: (context, state) {
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
                    'من فضلك قم بادخال الكود المرسل عبر رسالة نصية',
                    textAlign: TextAlign.right,
                    style: MainTheme.hintTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: VerificationCodeTextField(
                    validator: (s) {
                      return s == '2222' ? null : 'Pin is incorrect';
                    },
                    // onSubmitted: (value) {},
                    onChange: (value) {
                      smsCode = value;
                    },
                  ),
                ),
                SizedBox(
                  height: context.height * 0.06,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ConditionalBuilder(
                    condition: state is! VerificationLoadingState,
                    builder: (context) {
                      return CustomTextButton(
                        title: 'تأكيد',
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
      }),
    );
  }
}
