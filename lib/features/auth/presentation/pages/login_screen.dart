import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/helper_functions.dart';
import '../../../../core/utils/media_quiry_values.dart';
import '../../../../core/widgets/popup_page.dart';
import '../../../../core/widgets/register_text_field.dart';
import '../../../../core/widgets/text_button.dart';
import '../../../../service_locator.dart';
import '../cubit/login_cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String username, password;

  void _saveForm(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();

    await BlocProvider.of<LoginCubit>(context)
        .getDriverLoginData(userName: username, password: password);
    // Navigator.pushNamed(context, RoutePaths.);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state is LoginErrorState) {
          HelperFunctions.errorBar(
            context,
            message: state.errorMessege,
            duration: const Duration(seconds: 5),
            title: 'ERROR',
          );
        }
      }, builder: (context, state) {
        return PopUpPage(
          child: Center(
              child: Form(
            key: formKey,
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
                SizedBox(
                  height: context.height * 0.04,
                ),
                Container(
                  width: context.width * 0.7,
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  child: RegisterTextField(
                    icon: (Icons.festival_rounded),
                    label:
                        'captain_name', //localization.text('captain_name'),
                    onSaved: (value) => username = value!,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'captain_name_required'; //localization.text('captain_name_required');
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                Container(
                  width: context.width * 0.7,
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  child: RegisterTextField(
                    icon: (Icons.lock),
                    visibility: true,
                    label: 'password', //localization.text('password'),
                    onSaved: (value) => password = value!,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password_required'; //localization.text('password_required');
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                    alignment:
                        true //localization.currentLanguage.toString() == 'en'
                            ? Alignment.bottomRight
                            : Alignment.bottomLeft,
                    margin: EdgeInsets.only(
                        left:
                            true // localization.currentLanguage.toString() == 'en'
                                ? 0
                                : context.width * 0.15,
                        top: 10,
                        right:
                            true //localization.currentLanguage.toString() == 'en'
                                ? context.width * 0.15
                                : 0),
                    child: InkWell(
                      onTap: () {
                        // push(SendCodeScreen(
                        //   inx: 1,
                        // ));
                      },
                      child: Text(
                          'forget_password', //localization.text('forget_password')!,
                          style: const TextStyle(color: Colors.grey)),
                    )),
                SizedBox(
                  height: context.height * 0.06,
                ),
                Column(
                  children: [
                    ConditionalBuilder(
                      condition: state is! LoginLoadingState,
                      builder: (context) {
                        return CustomTextButton(
                          title: 'login', //localization.text('login'),
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
                    SizedBox(
                      height: context.height * 0.06,
                    ),
                    const Text(
                      'هل انت كابتن جديد ؟',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    CustomTextButton(
                      title: 'تقديم الطلب',
                      function: () {
                        // Navigator.pushNamed(context, AppRoutes.signUpScrreen);
                      },
                      radius: 25,
                    ),
                  ],
                ),
              ],
            ),
          )),
        );
      }),
    );
  }
}
