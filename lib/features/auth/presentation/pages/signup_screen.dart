import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import '../../../../core/functions/helper_functions.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/widgets/popup_page.dart';
import '../../../../core/widgets/register_text_field.dart';
import '../../../../core/widgets/text_button.dart';
import '../../../../service_locator.dart';
import '../cubit/requist_cubit/requist_cubit.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String username, phone, address, motoType, age;

  void _saveForm(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();
    await BlocProvider.of<RequistCubit>(context).createDriverRequist(
        username: username,
        phone: phone,
        address: address,
        motoType: motoType,
        age: age);
    // Navigator.pushNamed(context, AppRoutes.);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RequistCubit>(),
      child:
          BlocConsumer<RequistCubit, RequistState>(listener: (context, state) {
        if (state is RequistErrorState) {
          HelperFunctions.errorBar(
            context,
            message: state.errorMessege,
            duration: const Duration(seconds: 5),
            title: 'ERROR',
          );
        }
        if (state is RequistLoadingState) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog(
                  title:
                      'شكرا لك ,تم ارسال طلبك سيتم التواصل معك فى اقرب وقت ممكن',
                  widget: [
                    Center(
                      child: CustomTextButton(
                        title: 'اغلاق',
                        function: () {
                          // NavigationService.pushReplacementAll(
                          //     page: RoutePaths.authLogin,
                          //     isNamed: false);
                        },
                      ),
                    )
                  ],
                );
              });
        }
      }, builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: Center(
            child: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: context.height * 0.13, bottom: context.height * 0.03,),
                    child: Image(
                      image: const AssetImage('assets/images/yallaDeilvery.png'),
                      width: context.width * 0.45,
                      height: context.height * 0.2,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: context.height * 0.01),
                    width: context.width * 0.7,
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    child: RegisterTextField(
                      type: TextInputType.text,
                      label: 'الاسم ثلاثى',
                      onSaved: (value) => username = value!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'captain_name_required'; //localization.text('captain_name_required');
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: context.height * 0.01),
                    width: context.width * 0.7,
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    child: RegisterTextField(
                      type: TextInputType.phone,
                      label:
                          'phone_number', // localization.text('phone_number'),
                      onSaved: (value) => phone = value!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'invalid_phone_number'; // localization.text('invalid_phone_number');
                        }
                        if (value.length < 2) {
                          //TODO : 8
                          return 'invalid_phone_number';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: context.height * 0.01),
                    width: context.width * 0.7,
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    child: RegisterTextField(
                      type: TextInputType.text,
                      label:
                          'address_details', // localization.text('address_details'),
                      onSaved: (value) => address = value!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'address_details is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: context.height * 0.01),
                    width: context.width * 0.7,
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    child: RegisterTextField(
                      type: TextInputType.text,
                      label: 'نوع الدراجة',
                      onSaved: (value) => motoType = value!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'motor type is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: context.height * 0.01),
                    width: context.width * 0.7,
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    child: RegisterTextField(
                      type: TextInputType.number,
                      label: 'العمر',
                      onSaved: (value) => age = value!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'age is required';
                        }
                        if (int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'provide a valid number';
                        }
                        if (int.tryParse(value)! < 18) {
                          return 'you have to be 18 or more';
                        }
                        if (int.tryParse(value)! > 60) {
                          return 'you have to be 60 or less';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: context.height * 0.02, top: context.height * 0.05),
                    child: ConditionalBuilder(
                      condition: state is! RequistLoadingState,
                      builder: (context) {
                        return CustomTextButton(
                          title: 'تقديم',
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
          )),
        );
      }),
    );
  }
}
