import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import '../../../../config/themes/text_styles.dart';
import '../../../../core/functions/helper_functions.dart';
import '../../../../core/widgets/register_text_field.dart';
import '../../../../core/widgets/text_button.dart';
import '../../../../service_locator.dart';
import '../cubit/verification_cubit/verification_cubit.dart';

class SetPasswordScreen extends StatelessWidget {
  SetPasswordScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String password;

  void _saveForm(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();
    await BlocProvider.of<VerificationCubit>(context).setNewPassword(password);
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
            // Navigator.pushNamed(context, AppRoutes.);
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: context.height * 0.13,
                    ),
                    Image(
                      image:
                          const AssetImage('assets/images/yallaDeilvery.png'),
                      width: context.width * 0.45,
                      height: context.height * 0.2,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: context.height * 0.04, horizontal: 16),
                      child: Text(
                        'من فضلك قم بادخال كلمة السر الجديدة',
                        textAlign: TextAlign.right,
                        style: MainTheme.hintTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Container(
                        width: context.width * 0.7,
                        decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: RegisterTextField(
                          icon: (Icons.lock),
                          visibility: true,
                          label:
                              'new password', //localization.text('password'),
                          onSaved: (value) => password = value!,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password_required'; //localization.text('password_required');
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 20, top: context.height * 0.06),
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
            ),
          );
        },
      ),
    );
  }
}
