import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_delivery/core/functions/helper_functions.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import 'package:yalla_delivery/features/my_Profile/presentation/cubit/myprofile_cubit.dart';
import '../../../../core/widgets/popup_page.dart';
import '../../../../core/widgets/register_text_field.dart';
import '../../../../core/widgets/text_button.dart';
import '../../../../service_locator.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String oldPassword = '', newPassword = '', newPasswordAgain = '';

  Future<void> saveForm(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();
    if (newPassword != newPasswordAgain) {
      HelperFunctions.errorBar(context, message: 'different New Passwords');
      return;
    }
    if (newPassword == oldPassword) {
      HelperFunctions.errorBar(context,
          message: 'Old password and new password are the same');
      return;
    }
    if (newPassword.length < 6) {
      HelperFunctions.errorBar(context, message: 'New password is too short');
      return;
    }

    await BlocProvider.of<MyprofileCubit>(context).changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
    HelperFunctions.successBar(context,
        message: 'you have changed your password successfully');

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MyprofileCubit>(),
      child: BlocBuilder<MyprofileCubit, MyprofileState>(
          builder: (context, state) {
        return Scaffold(
          body: PopUpPage(
            showAppbar: true,
            appBartitle: 'Change password',
            child: Form(
              key: formKey,
              child: Container(
                color: Colors.white,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: context.height * 0.04,
                        ),
                        Center(
                          child: Container(
                            width: context.width * 0.7,
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey)),
                            ),
                            child: RegisterTextField(
                              onSaved: (value) {
                                oldPassword = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'password_required'; //localization.text('password_required');
                                }
                                return null;
                              },
                              label:
                                  'Old password', //localization.text('password'),
                              visibility: true,
                              hint: '********',
                              type: TextInputType.text,
                              icon: Icons.lock,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: context.height * 0.04,
                        ),
                        Center(
                          child: Container(
                            width: context.width * 0.7,
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey)),
                            ),
                            child: RegisterTextField(
                              onSaved: (value) {
                                newPassword = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'password_required'; //localization.text('password_required');
                                }
                                return null;
                              },
                              label:
                                  'New password', //localization.text('password'),
                              visibility: true,
                              hint: '********',
                              type: TextInputType.text,
                              icon: Icons.lock,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: context.height * 0.04,
                        ),
                        Center(
                          child: Container(
                            width: context.width * 0.7,
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey)),
                            ),
                            child: RegisterTextField(
                              onSaved: (value) {
                                newPasswordAgain = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'password_required'; //localization.text('password_required');
                                }
                                return null;
                              },
                              label:
                                  'password', //localization.text('password'),
                              visibility: true,
                              hint: '********',
                              type: TextInputType.text,
                              icon: Icons.lock,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ConditionalBuilder(
                        condition: state is! MyprofileLoadedState,
                        builder: (context) {
                          return Center(
                            child: CustomTextButton(
                              title: 'Save',
                              function: () {
                                saveForm(context);
                              },
                            ),
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
          ),
        );
      }),
    );
  }
}
